import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:iq_weather/config/flavor.dart';
import 'package:iq_weather/injectable.config.dart';
import 'package:iq_weather/repositories/weather/weather.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies(Flavor flavor) async =>
    getIt.init(environmentFilter: NoEnvOrContains(flavor.name));

@module
abstract class DefaultModule {
  @LazySingleton()
  Dio get dio => Dio();

  @Named('WeatherRepository#Cache')
  @preResolve
  @Singleton()
  Future<Box<Weather>> weatherRepositoryCache() async {
    Hive
      ..registerAdapter(WeatherAdapter())
      ..registerAdapter(WeatherIconAdapter());
    return Hive.openBox<Weather>('WeatherRepository#Cache');
  }
}
