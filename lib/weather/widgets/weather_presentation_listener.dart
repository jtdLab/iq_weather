import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter/material.dart';
import 'package:iq_weather/weather/weather.dart';

class WeatherPresentationListener extends StatelessWidget {
  const WeatherPresentationListener({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocPresentationListener<WeatherCubit, WeatherPresentationEvent>(
      listener: (context, event) => switch (event) {
        final WeatherRequestPermissions event =>
          _onRequestPermissions(context, event),
      },
    );
  }

  Future<void> _onRequestPermissions(
    BuildContext context,
    WeatherRequestPermissions event,
  ) async {
    // TODO(jtdLab): prompt to open app settings
  }
}
