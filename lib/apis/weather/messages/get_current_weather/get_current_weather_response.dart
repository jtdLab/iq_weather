import 'package:iq_weather/apis/weather/dtos/dtos.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_current_weather_response.g.dart';

/// {@template get_current_weather_response}
/// Response from calling GET https://api.brightsky.dev/current_weather
/// {@endtemplate}
@JsonSerializable()
class GetCurrentWeatherResponse {
  /// {@macro get_current_weather_response}
  const GetCurrentWeatherResponse({
    required this.weather,
    required this.sources,
  });

  /// GetCurrentWeatherResponse from [json].
  factory GetCurrentWeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCurrentWeatherResponseFromJson(json);

  /// GetCurrentWeatherResponse to [Map<String, dynamic>]
  Map<String, dynamic> toJson() => _$GetCurrentWeatherResponseToJson(this);

  /// The weather.
  final WeatherDto weather;

  /// The weather sources.
  final List<SourceDto> sources;
}
