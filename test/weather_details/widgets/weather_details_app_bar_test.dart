import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iq_weather/temperature/temperature.dart';
import 'package:iq_weather/weather_details/weather_details.dart';

import '../../helpers/helpers.dart';
import '../../mocks.dart';

final providers = <BlocProvider>[
  BlocProvider<TemperatureCubit>.value(
    value: MockTemperatureCubit(),
  ),
];

void main() {
  group(WeatherDetailsAppBar, () {
    group('renders localized title', () {
      Future<void> performTest(
        WidgetTester tester, {
        required Locale locale,
        required String title,
      }) async {
        await tester.pumpApp(
          providers: providers,
          child: const WeatherDetailsAppBar(),
          locale: locale,
        );
        expect(find.text(title), findsOneWidget);
      }

      testWidgets(
        '(en)',
        (tester) => performTest(
          tester,
          locale: const Locale('en'),
          title: 'Weather Details',
        ),
      );

      testWidgets(
        '(de)',
        (tester) => performTest(
          tester,
          locale: const Locale('de'),
          title: 'Wetter Details',
        ),
      );
    });

    testWidgets('renders TemperatureToggleUnitButton', (tester) async {
      await tester.pumpApp(
        providers: providers,
        child: const WeatherDetailsAppBar(),
      );
      expect(find.byType(TemperatureToggleUnitButton), findsOneWidget);
    });
  });
}
