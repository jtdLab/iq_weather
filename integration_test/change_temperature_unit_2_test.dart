import 'package:patrol/patrol.dart';

import 'helpers/helpers.dart';
import 'robots/robots.dart';

void main() {
  patrolTest('can change temperature unit from weather details', ($) async {
    final weatherRobot = WeatherRobot($);
    final weatherDetailsRobot = WeatherDetailsRobot($);
    await $.startApp();
    await $.native.selectFineLocation();
    await $.native.grantPermissionOnlyThisTime();
    await weatherRobot.tapIqbOfficeWeatherListTile();

    await weatherDetailsRobot.tapToggleTemperatureUnitButton();
    // TODO(jtdLab): implement
  });
}
