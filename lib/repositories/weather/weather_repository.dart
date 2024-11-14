import 'package:geolocator/geolocator.dart' as geo;
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:iq_weather/apis/weather/weather.dart';
import 'package:iq_weather/repositories/weather/weather.dart';
import 'package:logging/logging.dart';
import 'package:meta/meta.dart';

/// Failure union for [WeatherRepository.fetchWeather].
sealed class FetchWeatherFailure implements Exception {}

final class FetchWeatherPermissionDeniedFailure extends FetchWeatherFailure {}

final class FetchWeatherPermissionPermanentlyDeniedFailure
    extends FetchWeatherFailure {}

final class FetchWeatherFetchFailure extends FetchWeatherFailure {}

/// {@template weather_repository}
/// Repository to handle the weather domain.
/// {@endtemplate}
@LazySingleton()
class WeatherRepository {
  /// {@macro weather_repository}
  const WeatherRepository({
    required WeatherApi weatherApi,
    required Geolocator geolocator,
    @Named('WeatherRepository#Cache') required Box<Weather> cache,
  })  : _weatherApi = weatherApi,
        _geolocator = geolocator,
        _cache = cache;

  final WeatherApi _weatherApi;
  final Geolocator _geolocator;
  final Box<Weather> _cache;

  /// The logger can be overridden for testing.
  @visibleForTesting
  static Logger logger = Logger('WeatherRepository');

  /// Reads the current weather data at [location].
  ///
  /// Retruns [Weather.empty]  if nothing is cached.
  Weather readWeather({required WeatherLocation location}) {
    return _cache.get(location.name) ?? Weather.empty;
  }

  /// Fetches the current weather data at [location].
  ///
  /// Throws [FetchWeatherFailure].
  Future<Weather> fetchWeather({required WeatherLocation location}) async {
    late final ({double latitude, double longitude}) position;
    switch (location) {
      case WeatherLocation.local:
        var permission = await _geolocator.checkPermission();
        if (permission == geo.LocationPermission.denied) {
          permission = await _geolocator.requestPermission();
          if (permission == geo.LocationPermission.denied) {
            throw FetchWeatherPermissionDeniedFailure();
          }
        }
        if (permission == geo.LocationPermission.deniedForever) {
          throw throw FetchWeatherPermissionPermanentlyDeniedFailure();
        }

        position = await _geolocator
            .getCurrentPosition()
            .then((p) => (latitude: p.latitude, longitude: p.longitude));
      case WeatherLocation.iqbOffice:
      case WeatherLocation.buergerParkSaarbruecken:
        position = (latitude: location.latitude, longitude: location.longitude);
    }

    late final Weather weather;
    try {
      weather = await _weatherApi.fetchWeather(
        latitude: position.latitude,
        longitude: position.longitude,
      );
    } catch (e) {
      logger.warning(e);
      throw FetchWeatherFetchFailure();
    }
    await _cache.put(location.name, weather);
    return weather;
  }
}

/// Wrapper to allow mocking.
@LazySingleton()
class Geolocator {
  Future<geo.LocationPermission> checkPermission() {
    return geo.Geolocator.checkPermission();
  }

  Future<geo.LocationPermission> requestPermission() {
    return geo.Geolocator.requestPermission();
  }

  Future<geo.Position> getCurrentPosition() {
    return geo.Geolocator.getCurrentPosition();
  }
}
