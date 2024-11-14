import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iq_weather/weather/weather.dart';
import 'package:iq_weather_ui/iq_weather_ui.dart';

class WeatherBody extends StatelessWidget {
  const WeatherBody({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.select((WeatherCubit cubit) => cubit.state.status);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.m),
      child: switch (status) {
        WeatherStatus.loading => const WeatherLoading(),
        WeatherStatus.idle => const WeatherList(),
      },
    );
  }
}
