import 'package:patrol/patrol.dart';

import 'helpers/helpers.dart';
import 'robots/robots.dart';

void main() {
  patrolTest('can change temperature unit', ($) async {
    final weatherRobot = WeatherRobot($);
    await $.startApp();
    await $.native.selectFineLocation();
    await $.native.grantPermissionOnlyThisTime();

    await weatherRobot.tapToggleTemperatureUnitButton();
    // TODO(jtdLab): implement
  });
}
