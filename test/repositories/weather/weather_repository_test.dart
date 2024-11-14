import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:hive/hive.dart';
import 'package:iq_weather/apis/weather/weather_api.dart';
import 'package:iq_weather/repositories/weather/weather.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  group(WeatherRepository, () {
    late WeatherApi weatherApi;
    late Geolocator geolocator;
    late Box<Weather> cache;
    late WeatherRepository underTest;

    setUp(() {
      weatherApi = MockWeatherApi();
      geolocator = MockGeolocator();
      when(() => geolocator.checkPermission())
          .thenAnswer((_) async => geo.LocationPermission.always);
      cache = MockBox<Weather>();
      when(() => cache.put(any<String>(), weather)).thenAnswer((_) async {});
      underTest = WeatherRepository(
        weatherApi: weatherApi,
        geolocator: geolocator,
        cache: cache,
      );
    });

    group('readWeather', () {
      test('returns cached weather', () {
        const location = WeatherLocation.local;
        when(() => cache.get(location.name)).thenReturn(weather);
        expect(underTest.readWeather(location: location), weather);
      });

      test('returns empty weather when nothing is cached', () {
        const location = WeatherLocation.local;
        expect(underTest.readWeather(location: location), Weather.empty);
      });
    });

    group('fetchWeather', () {
      test('returns remote weather', () {
        const location = WeatherLocation.iqbOffice;
        when(
          () => weatherApi.fetchWeather(
            latitude: location.latitude,
            longitude: location.longitude,
          ),
        ).thenAnswer((_) async => weather);
        expect(underTest.fetchWeather(location: location), completion(weather));
      });

      test('caches remote weather', () async {
        const location = WeatherLocation.iqbOffice;
        when(
          () => weatherApi.fetchWeather(
            latitude: location.latitude,
            longitude: location.longitude,
          ),
        ).thenAnswer((_) async => weather);
        await underTest.fetchWeather(location: location);
        verify(() => cache.put(location.name, weather)).called(1);
      });

      test('throws when failed to fetch from remote', () {
        const location = WeatherLocation.iqbOffice;
        when(
          () => weatherApi.fetchWeather(
            latitude: location.latitude,
            longitude: location.longitude,
          ),
        ).thenThrow(Exception());
        expect(
          underTest.fetchWeather(location: location),
          throwsA(isA<FetchWeatherFetchFailure>()),
        );
      });

      test(
          'given location is local '
          'returns remote weather', () {
        const location = WeatherLocation.local;
        final position = MockPosition(latitude: 1.23, longitude: 4.56);
        when(() => geolocator.getCurrentPosition())
            .thenAnswer((_) async => position);
        when(() => weatherApi.fetchWeather(latitude: 1.23, longitude: 4.56))
            .thenAnswer((_) async => weather);
        expect(underTest.fetchWeather(location: location), completion(weather));
      });

      test(
          'given location is local '
          'throws when location permission denied', () {
        const location = WeatherLocation.local;
        when(() => geolocator.checkPermission())
            .thenAnswer((_) async => geo.LocationPermission.denied);
        when(() => geolocator.requestPermission())
            .thenAnswer((_) async => geo.LocationPermission.denied);
        expect(
          underTest.fetchWeather(location: location),
          throwsA(isA<FetchWeatherPermissionDeniedFailure>()),
        );
      });

      test(
          'given location is local '
          'throws when location permission permanently denied', () {
        const location = WeatherLocation.local;
        when(() => geolocator.checkPermission())
            .thenAnswer((_) async => geo.LocationPermission.deniedForever);
        expect(
          underTest.fetchWeather(location: location),
          throwsA(isA<FetchWeatherPermissionPermanentlyDeniedFailure>()),
        );
      });
    });
  });
}
