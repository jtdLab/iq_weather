import 'package:flutter_test/flutter_test.dart';
import 'package:iq_weather/keys.dart';
import 'package:patrol/patrol.dart';

class WeatherRobot {
  const WeatherRobot(this.tester);

  final PatrolIntegrationTester tester;

  Future<void> tapToggleTemperatureUnitButton() async {
    final button = find.byKey(Keys.temperatureToggleUnitButton);
    await tester.tap(button);
  }

  Future<void> tapBuergerParkSaarbrueckenWeatherListTile() async {
    final listTile = find.byKey(Keys.weatherListTileBuergerParkSaarbruecken);
    await tester.tap(listTile);
  }

  Future<void> tapIqbOfficeWeatherListTile() async {
    final listTile = find.byKey(Keys.weatherListTileIqbOffice);
    await tester.tap(listTile);
  }

  Future<void> tapLocalWeatherListTile() async {
    final listTile = find.byKey(Keys.weatherListTileLocal);
    await tester.tap(listTile);
  }
}
