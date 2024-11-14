import 'package:auto_route/auto_route.dart';
import 'package:iq_weather/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: null)
class AppRouter extends RootStackRouter {
  static AppRouter instance = AppRouter();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: WeatherPageRoute.page,
        ),
        AutoRoute(
          path: '/details',
          page: WeatherDetailsPageRoute.page,
        ),
      ];
}
