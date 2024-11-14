import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iq_weather/keys.dart';
import 'package:iq_weather/repositories/weather/weather.dart';
import 'package:iq_weather/router.gr.dart';
import 'package:iq_weather/shared/weather_icon.dart' as shared;
import 'package:iq_weather/shared/weather_location_text.dart' as shared;
import 'package:iq_weather/temperature/temperature.dart';
import 'package:iq_weather/weather/weather.dart';
import 'package:iq_weather_ui/iq_weather_ui.dart';

class WeatherListTileBuergerParkSaarbruecken extends StatelessWidget {
  const WeatherListTileBuergerParkSaarbruecken({super.key});

  @override
  Widget build(BuildContext context) {
    final weather = context.select(
      (WeatherCubit cubit) => cubit.state.buergerParkSaarbrueckenWeather,
    );

    return _WeatherListTile(
      key: Keys.weatherListTileBuergerParkSaarbruecken,
      location: WeatherLocation.buergerParkSaarbruecken,
      weather: weather,
    );
  }
}

class WeatherListTileIqbOffice extends StatelessWidget {
  const WeatherListTileIqbOffice({super.key});

  @override
  Widget build(BuildContext context) {
    final weather = context.select(
      (WeatherCubit cubit) => cubit.state.iqbOfficeWeather,
    );

    return _WeatherListTile(
      key: Keys.weatherListTileIqbOffice,
      location: WeatherLocation.iqbOffice,
      weather: weather,
    );
  }
}

class WeatherListTileLocal extends StatelessWidget {
  const WeatherListTileLocal({super.key});

  @override
  Widget build(BuildContext context) {
    final weather = context.select(
      (WeatherCubit cubit) => cubit.state.localWeather,
    );

    return _WeatherListTile(
      key: Keys.weatherListTileLocal,
      location: WeatherLocation.local,
      weather: weather,
    );
  }
}

class _WeatherListTile extends StatelessWidget {
  const _WeatherListTile({
    required this.location,
    required this.weather,
    super.key,
  });

  final WeatherLocation location;
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.hardEdge,
      child: ListTile(
        onTap: () =>
            context.navigateTo(WeatherDetailsPageRoute(location: location)),
        leading: shared.WeatherLocationText(
          location: location,
          style: theme.textTheme.titleLarge,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            shared.WeatherIcon(
              icon: weather.icon,
              size: IqWeatherIconSizes.xl,
            ),
            const Gap.m(),
            TemperatureText(
              celsius: weather.temperature,
              style: theme.textTheme.displayMedium,
            ),
          ],
        ),
      ),
    );
  }
}
