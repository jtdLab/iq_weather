import 'package:iq_weather/l10n/l10n.dart';
import 'package:iq_weather/router.dart';
import 'package:iq_weather_ui/iq_weather_ui.dart';

class App extends StatelessWidget {
  const App({super.key});

  /// Use this for widget testing.
  @visibleForTesting
  const factory App.test({
    required Widget home,
    ThemeMode? themeMode,
    Locale? locale,
    Key? key,
  }) = _AppTest;

  ThemeData get theme => DartSenseTheme.standard;

  ThemeData get darkTheme => DartSenseDarkTheme.standard;

  List<LocalizationsDelegate<dynamic>>? get localizationsDelegates => [
        ...AppLocalizations.localizationsDelegates,
      ];

  List<Locale> get supportedLocales => AppLocalizations.supportedLocales;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: theme,
      darkTheme: darkTheme,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      routerConfig: AppRouter.instance.config(),
    );
  }
}

class _AppTest extends App {
  const _AppTest({
    required this.home,
    this.themeMode,
    this.locale,
    super.key,
  });

  final Widget home;
  final ThemeMode? themeMode;
  final Locale? locale;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: theme,
      darkTheme: darkTheme,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      locale: locale,
      home: home,
    );
  }
}
