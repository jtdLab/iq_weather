import 'package:flutter/widgets.dart';
import 'package:iq_weather/l10n/app_localizations.dart';

extension L10nBuildContextX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
