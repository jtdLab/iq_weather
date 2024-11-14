import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iq_weather/temperature/temperature.dart';
import 'package:iq_weather/weather/weather.dart';

import '../../helpers/helpers.dart';
import '../../mocks.dart';

final providers = <BlocProvider>[
  BlocProvider<TemperatureCubit>.value(
    value: MockTemperatureCubit(),
  ),
];

void main() {
  group(WeatherAppBar, () {
    group('renders localized title', () {
      Future<void> performTest(
        WidgetTester tester, {
        required Locale locale,
        required String title,
      }) async {
        await tester.pumpApp(
          providers: providers,
          child: const WeatherAppBar(),
          locale: locale,
        );
        expect(find.text(title), findsOneWidget);
      }

      testWidgets(
        '(en)',
        (tester) => performTest(
          tester,
          locale: const Locale('en'),
          title: 'Weather',
        ),
      );

      testWidgets(
        '(de)',
        (tester) => performTest(
          tester,
          locale: const Locale('de'),
          title: 'Wetter',
        ),
      );
    });

    testWidgets('renders TemperatureToggleUnitButton', (tester) async {
      await tester.pumpApp(
        providers: providers,
        child: const WeatherAppBar(),
      );
      expect(find.byType(TemperatureToggleUnitButton), findsOneWidget);
    });
  });
}
