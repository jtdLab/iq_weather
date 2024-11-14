import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iq_weather/temperature/temperature.dart';
import 'package:iq_weather_ui/iq_weather_ui.dart';

class TemperatureText extends StatelessWidget {
  const TemperatureText({
    this.celsius,
    this.style,
    super.key,
  });

  final double? celsius;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final temperaturUnit =
        context.select((TemperatureCubit cubit) => cubit.state);

    return Text(
      switch (celsius) {
        final double celsius => switch (temperaturUnit) {
            TemperatureUnit.celsius => '${celsius.round()}°C',
            TemperatureUnit.fahrenheit => '${celsius.toFahrenheit().round()}°F',
          },
        _ => '-',
      },
      style: style,
    );
  }
}
