import 'package:iq_weather/repositories/weather/weather.dart' as w;
import 'package:iq_weather_ui/iq_weather_ui.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({
    this.icon,
    this.size,
    super.key,
  });

  final w.WeatherIcon? icon;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      switch (icon) {
        w.WeatherIcon.clearDay => IqWeatherIcons.clearDay,
        w.WeatherIcon.clearNight => IqWeatherIcons.clearNight,
        w.WeatherIcon.partlyCloudyDay => IqWeatherIcons.partlyCloudyDay,
        w.WeatherIcon.partlyCloudyNight => IqWeatherIcons.partlyCloudyNight,
        w.WeatherIcon.cloudy => IqWeatherIcons.cloudy,
        w.WeatherIcon.fog => IqWeatherIcons.fog,
        w.WeatherIcon.wind => IqWeatherIcons.wind,
        w.WeatherIcon.rain => IqWeatherIcons.rain,
        w.WeatherIcon.sleet => IqWeatherIcons.sleet,
        w.WeatherIcon.snow => IqWeatherIcons.snow,
        w.WeatherIcon.hail => IqWeatherIcons.hail,
        w.WeatherIcon.thunderstorm => IqWeatherIcons.thunderstorm,
        _ => null,
      },
      size: size,
    );
  }
}
