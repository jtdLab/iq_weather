import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iq_weather/config/flavor.dart';
import 'package:iq_weather/injectable.dart';
import 'package:iq_weather/repositories/weather/weather_repository.dart';
import 'package:iq_weather/temperature/temperature.dart';
import 'package:logging/logging.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Logger.root.onRecord.listen((record) {
    log(
      '${record.loggerName}: ${record.level.name}: ${record.time}: '
      '${record.message}',
    );
  });

  await Hive.initFlutter();

  await configureDependencies(flavor);

  Bloc.observer = const AppBlocObserver();

  runApp(
    RepositoryProvider(
      create: (context) => getIt<WeatherRepository>(),
      child: BlocProvider(
        create: (context) => TemperatureCubit(),
        child: await builder(),
      ),
    ),
  );
}
