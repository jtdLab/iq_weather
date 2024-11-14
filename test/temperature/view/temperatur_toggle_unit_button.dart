import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iq_weather/temperature/temperature.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';
import '../../mocks.dart';

void main() {
  group(TemperatureToggleUnitButton, () {
    testWidgets(
        'given current state is celsius '
        "renders '°C'", (tester) async {
      await tester.pumpApp(
        providers: [
          BlocProvider<TemperatureCubit>.value(value: MockTemperatureCubit()),
        ],
        child: const TemperatureToggleUnitButton(),
      );
      expect(find.text('°C'), findsOneWidget);
    });

    testWidgets(
        'given current state is fahrenheit '
        "renders '°F'", (tester) async {
      await tester.pumpApp(
        providers: [
          BlocProvider<TemperatureCubit>.value(
            value: MockTemperatureCubit(
              initialState: TemperatureUnit.fahrenheit,
            ),
          ),
        ],
        child: const TemperatureToggleUnitButton(),
      );
      expect(find.text('°F'), findsOneWidget);
    });

    testWidgets('calls toggleUnit when tapped', (tester) async {
      final temperatureUnitsCubit = MockTemperatureCubit();
      await tester.pumpApp(
        providers: [
          BlocProvider<TemperatureCubit>.value(value: temperatureUnitsCubit),
        ],
        child: const TemperatureToggleUnitButton(),
      );
      await tester.tap(find.byType(TemperatureToggleUnitButton));
      verify(temperatureUnitsCubit.toggleUnit).called(1);
    });
  });
}
