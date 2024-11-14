import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:iq_weather/repositories/weather/weather.dart';

part 'weather_details_state.dart';

class WeatherDetailsCubit extends Cubit<WeatherDetailsState> {
  WeatherDetailsCubit({
    required WeatherRepository weatherRepository,
    required WeatherLocation location,
  }) : super(
          WeatherDetailsState(
            location: location,
            weather: weatherRepository.readWeather(location: location),
          ),
        );
}
