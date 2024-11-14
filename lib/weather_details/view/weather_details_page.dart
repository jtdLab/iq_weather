import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iq_weather/repositories/weather/weather.dart';
import 'package:iq_weather/weather_details/weather_details.dart';
import 'package:iq_weather_ui/iq_weather_ui.dart';

@RoutePage()
class WeatherDetailsPage extends StatelessWidget implements AutoRouteWrapper {
  const WeatherDetailsPage({
    required this.location,
    super.key,
  });

  final WeatherLocation location;

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherDetailsCubit(
        weatherRepository: context.read(),
        location: location,
      ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const WeatherDetailsView();
  }
}

class WeatherDetailsView extends StatelessWidget {
  const WeatherDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: WeatherDetailsAppBar(),
      body: WeatherDetailsBody(),
    );
  }
}
