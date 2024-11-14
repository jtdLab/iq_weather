import 'package:bloc/bloc.dart';
import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:equatable/equatable.dart';
import 'package:iq_weather/repositories/weather/weather.dart';

part 'weather_presentation_event.dart';
part 'weather_state.dart';

WeatherState _initialState({required WeatherRepository weatherRepository}) {
  final localWeather =
      weatherRepository.readWeather(location: WeatherLocation.local);
  final iqbOfficeWeather =
      weatherRepository.readWeather(location: WeatherLocation.iqbOffice);
  final buergerParkSaarbrueckenWeather = weatherRepository.readWeather(
    location: WeatherLocation.buergerParkSaarbruecken,
  );
  return WeatherState(
    status: localWeather.isEmpty &&
            iqbOfficeWeather.isEmpty &&
            buergerParkSaarbrueckenWeather.isEmpty
        ? WeatherStatus.loading
        : WeatherStatus.idle,
    localWeather: localWeather,
    iqbOfficeWeather: iqbOfficeWeather,
    buergerParkSaarbrueckenWeather: buergerParkSaarbrueckenWeather,
  );
}

class WeatherCubit extends Cubit<WeatherState>
    with BlocPresentationMixin<WeatherState, WeatherPresentationEvent> {
  WeatherCubit({
    required WeatherRepository weatherRepository,
  })  : _weatherRepository = weatherRepository,
        super(_initialState(weatherRepository: weatherRepository));

  final WeatherRepository _weatherRepository;

  Future<void> viewLoaded() async {
    try {
      final iqbOfficeWeather = await _weatherRepository.fetchWeather(
        location: WeatherLocation.iqbOffice,
      );
      emit(state.copyWith(iqbOfficeWeather: iqbOfficeWeather));
    } catch (_) {}

    try {
      final buergerParkSaarbrueckenWeather = await _weatherRepository
          .fetchWeather(location: WeatherLocation.buergerParkSaarbruecken);
      emit(
        state.copyWith(
          buergerParkSaarbrueckenWeather: buergerParkSaarbrueckenWeather,
        ),
      );
    } catch (_) {}

    emit(state.copyWith(status: WeatherStatus.idle));

    try {
      final localWeather = await _weatherRepository.fetchWeather(
        location: WeatherLocation.local,
      );
      emit(state.copyWith(localWeather: localWeather));
    } on FetchWeatherPermissionPermanentlyDeniedFailure catch (_) {
      emitPresentation(WeatherRequestPermissions());
    }
  }
}
