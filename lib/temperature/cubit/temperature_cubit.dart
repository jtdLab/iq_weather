import 'package:flutter_bloc/flutter_bloc.dart';

part 'temperature_state.dart';

class TemperatureCubit extends Cubit<TemperatureUnit> {
  TemperatureCubit() : super(TemperatureUnit.celsius);

  void toggleUnit() {
    emit(
      state == TemperatureUnit.celsius
          ? TemperatureUnit.fahrenheit
          : TemperatureUnit.celsius,
    );
  }
}
