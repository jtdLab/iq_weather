import 'package:flutter_test/flutter_test.dart';
import 'package:iq_weather/keys.dart';
import 'package:patrol/patrol.dart';

class WeatherDetailsRobot {
  const WeatherDetailsRobot(this.tester);

  final PatrolIntegrationTester tester;

  Future<void> tapToggleTemperatureUnitButton() async {
    final button = find.byKey(Keys.temperatureToggleUnitButton);
    await tester.tap(button);
  }
}
