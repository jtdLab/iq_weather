part of 'weather_details_cubit.dart';

class WeatherDetailsState extends Equatable {
  const WeatherDetailsState({
    required this.location,
    required this.weather,
  });

  final WeatherLocation location;
  final Weather weather;

  WeatherDetailsState copyWith({
    WeatherLocation? location,
    Weather? weather,
  }) {
    return WeatherDetailsState(
      location: location ?? this.location,
      weather: weather ?? this.weather,
    );
  }

  @override
  List<Object?> get props => [
        location,
        weather,
      ];
}
