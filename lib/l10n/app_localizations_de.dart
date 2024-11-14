// ignore_for_file: always_use_package_imports, noop_primitive_operations, lines_longer_than_80_chars, use_super_parameters, avoid_escaping_inner_quotes, unused_local_variable, omit_local_variable_types, no_leading_underscores_for_local_identifiers, prefer_final_locals, unnecessary_string_interpolations, require_trailing_commas, unnecessary_string_escapes

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get weatherAppBarTitle => 'Wetter';

  @override
  String get weatherDetailsAppBarTitle => 'Wetter Details';

  @override
  String get weatherDetailsItemDistanceToWeatherStationTitle =>
      'Entfernung zur Station';

  @override
  String get weatherDetailsItemHumidityTitle => 'Luftfeuchtigkeit';

  @override
  String get weatherDetailsItemPrecipitationTitle =>
      'Niederschlag (letzte 10 Minuten)';

  @override
  String get weatherLocationTextLocal => 'Mein Standort';

  @override
  String get weatherLocationTextIqbOffice => 'IO Buddy Büro';

  @override
  String get weatherLocationTextBuergerParkSaarbruecken => 'Bürger Park';
}
