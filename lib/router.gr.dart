// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:iq_weather/repositories/weather/weather.dart' as _i4;
import 'package:iq_weather/weather/view/weather_page.dart' as _i2;
import 'package:iq_weather/weather_details/view/weather_details_page.dart'
    as _i1;
import 'package:iq_weather_ui/iq_weather_ui.dart' as _i5;

/// generated route for
/// [_i1.WeatherDetailsPage]
class WeatherDetailsPageRoute
    extends _i3.PageRouteInfo<WeatherDetailsPageRouteArgs> {
  WeatherDetailsPageRoute({
    required _i4.WeatherLocation location,
    _i5.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          WeatherDetailsPageRoute.name,
          args: WeatherDetailsPageRouteArgs(
            location: location,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'WeatherDetailsPageRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WeatherDetailsPageRouteArgs>();
      return _i3.WrappedRoute(
          child: _i1.WeatherDetailsPage(
        location: args.location,
        key: args.key,
      ));
    },
  );
}

class WeatherDetailsPageRouteArgs {
  const WeatherDetailsPageRouteArgs({
    required this.location,
    this.key,
  });

  final _i4.WeatherLocation location;

  final _i5.Key? key;

  @override
  String toString() {
    return 'WeatherDetailsPageRouteArgs{location: $location, key: $key}';
  }
}

/// generated route for
/// [_i2.WeatherPage]
class WeatherPageRoute extends _i3.PageRouteInfo<void> {
  const WeatherPageRoute({List<_i3.PageRouteInfo>? children})
      : super(
          WeatherPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'WeatherPageRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return _i3.WrappedRoute(child: const _i2.WeatherPage());
    },
  );
}
