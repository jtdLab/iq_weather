import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iq_weather/shared/weather_icon.dart' as shared;
import 'package:iq_weather/shared/weather_location_text.dart' as shared;
import 'package:iq_weather/temperature/temperature.dart';
import 'package:iq_weather/weather_details/weather_details.dart';
import 'package:iq_weather_ui/iq_weather_ui.dart';

class WeatherDetailsBody extends StatelessWidget {
  const WeatherDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final location = context.select(
      (WeatherDetailsCubit cubit) => cubit.state.location,
    );
    final weather = context.select(
      (WeatherDetailsCubit cubit) => cubit.state.weather,
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.m),
      child: Column(
        children: [
          shared.WeatherLocationText(location: location),
          const Gap.xl(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              shared.WeatherIcon(
                icon: weather.icon,
                size: IqWeatherIconSizes.xl,
              ),
              const Gap.l(),
              TemperatureText(
                celsius: weather.temperature,
                style: theme.textTheme.displayLarge,
              ),
            ],
          ),
          const Gap.xl(),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              WeatherDetailsItemPrecipitation(),
              Gap.s(),
              WeatherDetailsItemHumidity(),
              Gap.s(),
              WeatherDetailsItemDistanceToWeatherStation(),
            ],
          ),
        ],
      ),
    );
  }
}
