import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iq_weather/l10n/l10n.dart';
import 'package:iq_weather/weather_details/weather_details.dart';
import 'package:iq_weather_ui/iq_weather_ui.dart';

class WeatherDetailsItemDistanceToWeatherStation extends StatelessWidget {
  const WeatherDetailsItemDistanceToWeatherStation({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final distanceToWeatherStation = context.select(
      (WeatherDetailsCubit cubit) =>
          cubit.state.weather.distanceToWeatherStation,
    );

    return _WeatherDetailsItem(
      title: l10n.weatherDetailsItemDistanceToWeatherStationTitle,
      value: '$distanceToWeatherStation m',
    );
  }
}

class WeatherDetailsItemHumidity extends StatelessWidget {
  const WeatherDetailsItemHumidity({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final humidity = context.select(
      (WeatherDetailsCubit cubit) => cubit.state.weather.humidity,
    );

    return _WeatherDetailsItem(
      title: l10n.weatherDetailsItemHumidityTitle,
      value: '${humidity?.toString() ?? '-'} %',
    );
  }
}

class WeatherDetailsItemPrecipitation extends StatelessWidget {
  const WeatherDetailsItemPrecipitation({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final precipitation = context.select(
      (WeatherDetailsCubit cubit) => cubit.state.weather.precipitation,
    );

    return _WeatherDetailsItem(
      title: l10n.weatherDetailsItemPrecipitationTitle,
      value: '${precipitation?.toString() ?? '-'} mm',
    );
  }
}

class _WeatherDetailsItem extends StatelessWidget {
  const _WeatherDetailsItem({
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Column(
        children: [
          Text(
            title,
            style: theme.textTheme.titleMedium
                ?.copyWith(color: theme.colorScheme.primary),
          ),
          Text(
            value,
            style: theme.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
