import 'package:iq_weather/l10n/l10n.dart';
import 'package:iq_weather/temperature/temperature.dart';
import 'package:iq_weather_ui/iq_weather_ui.dart';

class WeatherAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WeatherAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return AppBar(
      title: Text(l10n.weatherAppBarTitle),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: context.m),
          child: const TemperatureToggleUnitButton(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
