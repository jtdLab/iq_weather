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
  BlocProvider<WeatherCubit>.value(
    value: MockWeatherCubit(),
  ),
];

void main() {
  group(WeatherPage, () {
    // TODO(jtdLab): implement
    // testWidgets('renders WeatherView', (tester) async {
    //   await tester.pumpApp(
    //     providers: providers,
    //     child: const WeatherPage(),
    //   );
    //   expect(find.byType(WeatherView), findsOneWidget);
    // });

    // TODO(jtdLab): implement test presentation listener
  });

  group(WeatherView, () {
    testWidgets('renders WeatherAppBar', (tester) async {
      await tester.pumpApp(
        providers: providers,
        child: const WeatherView(),
      );
      expect(find.byType(WeatherAppBar), findsOneWidget);
    });

    testWidgets('renders WeatherBody', (tester) async {
      await tester.pumpApp(
        providers: providers,
        child: const WeatherView(),
      );
      expect(find.byType(WeatherBody), findsOneWidget);
    });
  });
}
