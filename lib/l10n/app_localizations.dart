// ignore_for_file: always_use_package_imports, noop_primitive_operations, lines_longer_than_80_chars, use_super_parameters, avoid_escaping_inner_quotes, unused_local_variable, omit_local_variable_types, no_leading_underscores_for_local_identifiers, prefer_final_locals, unnecessary_string_interpolations, require_trailing_commas, unnecessary_string_escapes
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en')
  ];

  /// No description provided for @weatherAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Weather'**
  String get weatherAppBarTitle;

  /// No description provided for @weatherDetailsAppBarTitle.
  ///
  /// In en, this message translates to:
  /// **'Weather Details'**
  String get weatherDetailsAppBarTitle;

  /// No description provided for @weatherDetailsItemDistanceToWeatherStationTitle.
  ///
  /// In en, this message translates to:
  /// **'Distance to station'**
  String get weatherDetailsItemDistanceToWeatherStationTitle;

  /// No description provided for @weatherDetailsItemHumidityTitle.
  ///
  /// In en, this message translates to:
  /// **'Humidity'**
  String get weatherDetailsItemHumidityTitle;

  /// No description provided for @weatherDetailsItemPrecipitationTitle.
  ///
  /// In en, this message translates to:
  /// **'Precipation (last 10 Minutes)'**
  String get weatherDetailsItemPrecipitationTitle;

  /// No description provided for @weatherLocationTextLocal.
  ///
  /// In en, this message translates to:
  /// **'My Location'**
  String get weatherLocationTextLocal;

  /// No description provided for @weatherLocationTextIqbOffice.
  ///
  /// In en, this message translates to:
  /// **'IO Buddy Office'**
  String get weatherLocationTextIqbOffice;

  /// No description provided for @weatherLocationTextBuergerParkSaarbruecken.
  ///
  /// In en, this message translates to:
  /// **'Buerger Park'**
  String get weatherLocationTextBuergerParkSaarbruecken;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
