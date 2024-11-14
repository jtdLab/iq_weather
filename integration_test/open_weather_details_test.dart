import 'package:iq_weather/weather_details/weather_details.dart';
import 'package:patrol/patrol.dart';

import 'helpers/helpers.dart';
import 'robots/robots.dart';

void main() {
  patrolTest('can open weather details', ($) async {
    final weatherRobot = WeatherRobot($);
    await $.startApp();
    await $.native.selectFineLocation();
    await $.native.grantPermissionOnlyThisTime();

    await weatherRobot.tapIqbOfficeWeatherListTile();
    await $.verifyShows(WeatherDetailsPage);
  });
}
