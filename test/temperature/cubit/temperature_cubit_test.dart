import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iq_weather/temperature/temperature.dart';

void main() {
  group(TemperatureCubit, () {
    test('initial state is celsius', () {
      expect(TemperatureCubit().state, TemperatureUnit.celsius);
    });

    blocTest<TemperatureCubit, TemperatureUnit>(
      'given current state is celsius '
      'emits [fahrenheit] when toggleUnit is called',
      build: TemperatureCubit.new,
      seed: () => TemperatureUnit.celsius,
      act: (cubit) => cubit.toggleUnit(),
      expect: () => [TemperatureUnit.fahrenheit],
    );

    blocTest<TemperatureCubit, TemperatureUnit>(
      'given current state is fahrenheit '
      'emits [celsius] when toggleUnit is called',
      build: TemperatureCubit.new,
      seed: () => TemperatureUnit.fahrenheit,
      act: (cubit) => cubit.toggleUnit(),
      expect: () => [TemperatureUnit.celsius],
    );
  });
}
