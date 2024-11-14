import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iq_weather/repositories/weather/weather.dart';
import 'package:iq_weather/temperature/temperature.dart';
import 'package:iq_weather/weather_details/weather_details.dart';

import '../../helpers/helpers.dart';
import '../../mocks.dart';

final providers = <BlocProvider>[
  BlocProvider<TemperatureCubit>.value(
    value: MockTemperatureCubit(),
  ),
  BlocProvider<WeatherDetailsCubit>.value(
    value: MockWeatherDetailsCubit(),
  ),
];

void main() {
  group(WeatherDetailsPage, () {
    testWidgets('renders WeatherDetailsView', (tester) async {
      await tester.pumpApp(
        providers: providers,
        child: const WeatherDetailsPage(
          location: WeatherLocation.local,
        ),
      );
      expect(find.byType(WeatherDetailsView), findsOneWidget);
    });
  });

  group(WeatherDetailsView, () {
    testWidgets('renders WeatherDetailsAppBar', (tester) async {
      await tester.pumpApp(
        providers: providers,
        child: const WeatherDetailsView(),
      );
      expect(find.byType(WeatherDetailsAppBar), findsOneWidget);
    });

    testWidgets('renders WeatherDetailsBody', (tester) async {
      await tester.pumpApp(
        providers: providers,
        child: const WeatherDetailsView(),
      );
      expect(find.byType(WeatherDetailsBody), findsOneWidget);
    });
  });
}
