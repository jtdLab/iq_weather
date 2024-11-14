part of 'weather_cubit.dart';

sealed class WeatherPresentationEvent extends Equatable {}

final class WeatherRequestPermissions extends WeatherPresentationEvent {
  @override
  List<Object?> get props => [];
}
