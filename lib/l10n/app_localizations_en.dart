// ignore_for_file: always_use_package_imports, noop_primitive_operations, lines_longer_than_80_chars, use_super_parameters, avoid_escaping_inner_quotes, unused_local_variable, omit_local_variable_types, no_leading_underscores_for_local_identifiers, prefer_final_locals, unnecessary_string_interpolations, require_trailing_commas, unnecessary_string_escapes

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get weatherAppBarTitle => 'Weather';

  @override
  String get weatherDetailsAppBarTitle => 'Weather Details';

  @override
  String get weatherDetailsItemDistanceToWeatherStationTitle =>
      'Distance to station';

  @override
  String get weatherDetailsItemHumidityTitle => 'Humidity';

  @override
  String get weatherDetailsItemPrecipitationTitle =>
      'Precipation (last 10 Minutes)';

  @override
  String get weatherLocationTextLocal => 'My Location';

  @override
  String get weatherLocationTextIqbOffice => 'IO Buddy Office';

  @override
  String get weatherLocationTextBuergerParkSaarbruecken => 'Buerger Park';
}
