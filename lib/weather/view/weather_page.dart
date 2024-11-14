import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iq_weather/weather/weather.dart';
import 'package:iq_weather_ui/iq_weather_ui.dart';

@RoutePage()
class WeatherPage extends StatelessWidget implements AutoRouteWrapper {
  const WeatherPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(
        weatherRepository: context.read(),
      )..viewLoaded(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const WeatherPresentationListener(
      child: WeatherView(),
    );
  }
}

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: WeatherAppBar(),
      body: WeatherBody(),
    );
  }
}
