part of 'weather_cubit.dart';

enum WeatherStatus { idle, loading }

class WeatherState extends Equatable {
  const WeatherState({
    required this.status,
    this.localWeather = Weather.empty,
    this.iqbOfficeWeather = Weather.empty,
    this.buergerParkSaarbrueckenWeather = Weather.empty,
  });

  final WeatherStatus status;
  final Weather localWeather;
  final Weather iqbOfficeWeather;
  final Weather buergerParkSaarbrueckenWeather;

  WeatherState copyWith({
    WeatherStatus? status,
    Weather? localWeather,
    Weather? iqbOfficeWeather,
    Weather? buergerParkSaarbrueckenWeather,
  }) {
    return WeatherState(
      status: status ?? this.status,
      localWeather: localWeather ?? this.localWeather,
      iqbOfficeWeather: iqbOfficeWeather ?? this.iqbOfficeWeather,
      buergerParkSaarbrueckenWeather:
          buergerParkSaarbrueckenWeather ?? this.buergerParkSaarbrueckenWeather,
    );
  }

  @override
  List<Object?> get props => [
        status,
        localWeather,
        iqbOfficeWeather,
        buergerParkSaarbrueckenWeather,
      ];
}
