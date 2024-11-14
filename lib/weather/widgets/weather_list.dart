import 'package:iq_weather/weather/weather.dart';
import 'package:iq_weather_ui/iq_weather_ui.dart';

class WeatherList extends StatelessWidget {
  const WeatherList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        WeatherListTileLocal(),
        WeatherListTileIqbOffice(),
        WeatherListTileBuergerParkSaarbruecken(),
      ],
    );
  }
}
