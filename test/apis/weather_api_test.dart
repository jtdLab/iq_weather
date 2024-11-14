import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iq_weather/apis/weather/weather_api.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';

void main() {
  group(BrightSkyWeatherApi, () {
    late Dio dio;

    late BrightSkyWeatherApi underTest;

    setUp(() {
      dio = MockDio();
      underTest = BrightSkyWeatherApi(dio: dio);
    });

    test('is WeatherApi', () {
      expect(underTest, isA<WeatherApi>());
    });

    group('fetchWeather', () {
      late Response<Map<String, dynamic>> response;

      setUp(() {
        response = MockResponse();
      });

      test('returns remote weather', () async {
        when(() => response.statusCode).thenReturn(200);
        when(() => response.data).thenReturn(rawGetCurrentWeatherResponse);
        when(
          () => dio.get<Map<String, dynamic>>(
            'https://api.brightsky.dev/current_weather',
            queryParameters: {
              'lat': 1.23,
              'lon': 3.45,
              'units': 'dwd',
            },
          ),
        ).thenAnswer((_) async => response);

        expect(
          underTest.fetchWeather(latitude: 1.23, longitude: 3.45),
          completion(weather),
        );
      });

      test('throws when unable to load data', () {
        when(() => response.statusCode).thenReturn(401);
        when(
          () => dio.get<Map<String, dynamic>>(
            'https://api.brightsky.dev/current_weather',
            queryParameters: {
              'lat': 1.23,
              'lon': 3.45,
              'units': 'dwd',
            },
          ),
        ).thenAnswer((_) async => response);
        expect(
          underTest.fetchWeather(latitude: 1.23, longitude: 3.45),
          throwsException,
        );
      });

      test('throws when invalid data received', () {
        when(() => response.statusCode).thenReturn(200);
        when(() => response.data).thenReturn({'foo': 'bar'});
        when(
          () => dio.get<Map<String, dynamic>>(
            'https://api.brightsky.dev/current_weather',
            queryParameters: {
              'lat': 1.23,
              'lon': 3.45,
              'units': 'dwd',
            },
          ),
        ).thenAnswer((_) async => response);
        expect(
          underTest.fetchWeather(latitude: 1.23, longitude: 3.45),
          throwsException,
        );
      });
    });
  });
}
