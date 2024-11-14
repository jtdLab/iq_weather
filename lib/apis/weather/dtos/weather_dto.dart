import 'package:json_annotation/json_annotation.dart';

part 'weather_dto.g.dart';

/// {@template weather_dto}
/// A Data Transfer Object for weather data.
/// {@endtemplate}
@JsonSerializable()
class WeatherDto {
  /// {@macro weather_dto}
  const WeatherDto({
    required this.temperature,
    required this.precipitation,
    required this.humidity,
    required this.icon,
  });

  /// Converts a JSON [Map] into a [WeatherDto] instance.
  factory WeatherDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherDtoFromJson(json);

  /// Converts this [WeatherDto] instance into a JSON [Map].
  Map<String, dynamic> toJson() => _$WeatherDtoToJson(this);

  /// The temperature degrees celsius.
  final double? temperature;

  /// The precipitation during previous 10 minutes in mm.
  @JsonKey(name: 'precipitation_10')
  final int? precipitation;

  /// The humidity in percent.
  @JsonKey(name: 'relative_humidity')
  final int? humidity;

  /// The icon.
  final String? icon;
}
