import 'package:iq_weather_ui/iq_weather_ui.dart';

class WeatherLoading extends StatelessWidget {
  const WeatherLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
