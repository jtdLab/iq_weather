import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iq_weather/keys.dart';
import 'package:iq_weather/temperature/temperature.dart';
import 'package:iq_weather_ui/iq_weather_ui.dart';

class TemperatureToggleUnitButton extends StatelessWidget {
  const TemperatureToggleUnitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final temperatureUnit =
        context.select((TemperatureCubit cubit) => cubit.state);

    return FilledButton(
      key: Keys.temperatureToggleUnitButton,
      onPressed: () => context.read<TemperatureCubit>().toggleUnit(),
      child: Text(
        switch (temperatureUnit) {
          TemperatureUnit.celsius => '°C',
          TemperatureUnit.fahrenheit => '°F',
        },
      ),
    );
  }
}
