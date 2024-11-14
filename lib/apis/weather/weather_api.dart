// ignore_for_file: one_member_abstracts

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:iq_weather/apis/weather/messages/messages.dart';
import 'package:iq_weather/repositories/weather/weather.dart';

/// {@template weather_api}
/// Api handling weather domain.
/// {@endtemplate}
abstract class WeatherApi {
  /// {@macro weather_api}
  const WeatherApi();

  /// Fetches current weather data for the location at [latitude], [longitude].
  Future<Weather> fetchWeather({
    required double latitude,
    required double longitude,
  });
}

/// {@template bright_sky_weather_api}
/// Implementation of [WeatherApi] using https://brightsky.dev/
/// {@endtemplate}
@LazySingleton(as: WeatherApi)
class BrightSkyWeatherApi implements WeatherApi {
  /// {@macro bright_sky_weather_api}
  const BrightSkyWeatherApi({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  static const _baseUrl = 'https://api.brightsky.dev';

  static const _kFetchWeatherUnits = 'dwd';

  @override
  Future<Weather> fetchWeather({
    required double latitude,
    required double longitude,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '$_baseUrl/current_weather',
      queryParameters: {
        'lat': latitude,
        'lon': longitude,
        'units': _kFetchWeatherUnits,
      },
    );

    if (response.statusCode == 200) {
      try {
        final body = GetCurrentWeatherResponse.fromJson(response.data ?? {});
        return Weather(
          temperature: body.weather.temperature,
          precipitation: body.weather.precipitation,
          humidity: body.weather.humidity,
          distanceToWeatherStation: body.sources.first.distance,
          icon: WeatherIcon.parse(body.weather.icon),
        );
      } catch (_) {
        throw Exception('Failed to deserialize data.');
      }
    } else {
      throw Exception('Failed to load weather data.');
    }
  }
}
