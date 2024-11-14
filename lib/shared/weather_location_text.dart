import 'package:flutter/material.dart';
import 'package:iq_weather/l10n/l10n.dart';
import 'package:iq_weather/repositories/weather/weather.dart';

class WeatherLocationText extends StatelessWidget {
  const WeatherLocationText({
    required this.location,
    this.style,
    super.key,
  });

  final WeatherLocation location;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Text(
      switch (location) {
        WeatherLocation.local => l10n.weatherLocationTextLocal,
        WeatherLocation.iqbOffice => l10n.weatherLocationTextIqbOffice,
        WeatherLocation.buergerParkSaarbruecken =>
          l10n.weatherLocationTextBuergerParkSaarbruecken,
      },
      style: style,
    );
  }
}
