import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'weather.g.dart';

/// {@template weather}
/// A Model for weather data.
/// {@endtemplate}
@HiveType(typeId: 0)
class Weather extends Equatable {
  /// {@macro weather}
  const Weather({
    required this.temperature,
    required this.precipitation,
    required this.humidity,
    required this.distanceToWeatherStation,
    required this.icon,
  });

  /// Empty [Weather] instance.
  static const empty = Weather(
    temperature: null,
    precipitation: null,
    humidity: null,
    distanceToWeatherStation: 0,
    icon: null,
  );

  /// The temperature degrees celsius.
  @HiveField(0)
  final double? temperature;

  /// The precipitation during previous 10 minutes in mm.
  @HiveField(1)
  final int? precipitation;

  /// The humidity in percent.
  @HiveField(2)
  final int? humidity;

  /// The distance to the weather station in meters.
  @HiveField(3)
  final int distanceToWeatherStation;

  /// The icon.
  @HiveField(4)
  final WeatherIcon? icon;

  /// Convenience getter to determine wether this is [empty].
  bool get isEmpty => this == empty;

  @override
  List<Object?> get props => [
        temperature,
        precipitation,
        humidity,
        distanceToWeatherStation,
        icon,
      ];
}

/// Icon alias suitable for the current weather conditions.
@HiveType(typeId: 2)
enum WeatherIcon {
  @HiveField(0)
  clearDay,
  @HiveField(1)
  clearNight,
  @HiveField(2)
  partlyCloudyDay,
  @HiveField(3)
  partlyCloudyNight,
  @HiveField(4)
  cloudy,
  @HiveField(5)
  fog,
  @HiveField(6)
  wind,
  @HiveField(7)
  rain,
  @HiveField(8)
  sleet,
  @HiveField(9)
  snow,
  @HiveField(10)
  hail,
  @HiveField(11)
  thunderstorm;

  static WeatherIcon? parse(String? raw) {
    return switch (raw) {
      'clear-day' => WeatherIcon.clearDay,
      'clear-night' => WeatherIcon.clearNight,
      'partly-cloudy-day' => WeatherIcon.partlyCloudyDay,
      'partly-cloudy-night' => WeatherIcon.partlyCloudyNight,
      'cloudy' => WeatherIcon.cloudy,
      'fog' => WeatherIcon.fog,
      'wind' => WeatherIcon.wind,
      'rain' => WeatherIcon.rain,
      'sleet' => WeatherIcon.sleet,
      'snow' => WeatherIcon.snow,
      'hail' => WeatherIcon.hail,
      'thunderstorm' => WeatherIcon.thunderstorm,
      _ => null,
    };
  }
}
