import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iq_weather/temperature/temperature.dart';

import '../../helpers/helpers.dart';
import '../../mocks.dart';

void main() {
  group(TemperatureText, () {
    testWidgets('renders correct rounded celsius', (tester) async {
      await tester.pumpApp(
        providers: [
          BlocProvider<TemperatureCubit>.value(value: MockTemperatureCubit()),
        ],
        child: const TemperatureText(celsius: 19.5),
      );
      expect(find.text('20°C'), findsOneWidget);
    });

    testWidgets('renders correct rounded fahrenheit', (tester) async {
      await tester.pumpApp(
        providers: [
          BlocProvider<TemperatureCubit>.value(
            value: MockTemperatureCubit(
              initialState: TemperatureUnit.fahrenheit,
            ),
          ),
        ],
        child: const TemperatureText(celsius: 24),
      );
      expect(find.text('75°F'), findsOneWidget);
    });

    testWidgets("renders '-' for nulls", (tester) async {
      await tester.pumpApp(
        providers: [
          BlocProvider<TemperatureCubit>.value(value: MockTemperatureCubit()),
        ],
        child: const TemperatureText(),
      );
      expect(find.text('-'), findsOneWidget);
    });
  });
}
