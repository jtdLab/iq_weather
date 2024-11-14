// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;
import 'package:iq_weather/apis/weather/weather.dart' as _i229;
import 'package:iq_weather/apis/weather/weather_api.dart' as _i526;
import 'package:iq_weather/injectable.dart' as _i353;
import 'package:iq_weather/repositories/weather/weather.dart' as _i915;
import 'package:iq_weather/repositories/weather/weather_repository.dart'
    as _i391;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final defaultModule = _$DefaultModule();
    gh.lazySingleton<_i361.Dio>(() => defaultModule.dio);
    gh.lazySingleton<_i391.Geolocator>(() => _i391.Geolocator());
    await gh.singletonAsync<_i979.Box<_i915.Weather>>(
      () => defaultModule.weatherRepositoryCache(),
      instanceName: 'WeatherRepository#Cache',
      preResolve: true,
    );
    gh.lazySingleton<_i526.WeatherApi>(
        () => _i526.BrightSkyWeatherApi(dio: gh<_i361.Dio>()));
    gh.lazySingleton<_i391.WeatherRepository>(() => _i391.WeatherRepository(
          weatherApi: gh<_i229.WeatherApi>(),
          geolocator: gh<_i391.Geolocator>(),
          cache: gh<_i979.Box<_i915.Weather>>(
              instanceName: 'WeatherRepository#Cache'),
        ));
    return this;
  }
}

class _$DefaultModule extends _i353.DefaultModule {}
