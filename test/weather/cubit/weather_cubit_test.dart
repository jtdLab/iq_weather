import 'package:bloc_presentation_test/bloc_presentation_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iq_weather/repositories/weather/weather.dart';
import 'package:iq_weather/weather/weather.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  group(WeatherCubit, () {
    late WeatherRepository weatherRepository;

    setUp(() {
      weatherRepository = MockWeatherRepository();
    });

    group('initial state', () {
      test('takes cached weathers from repository', () {
        final cubit = WeatherCubit(weatherRepository: weatherRepository);
        when(
          () => weatherRepository.readWeather(
            location: WeatherLocation.buergerParkSaarbruecken,
          ),
        ).thenReturn(weather);
        when(
          () => weatherRepository.readWeather(
            location: WeatherLocation.iqbOffice,
          ),
        ).thenReturn(weather1);
        when(
          () => weatherRepository.readWeather(
            location: WeatherLocation.local,
          ),
        ).thenReturn(weather2);
        expect(
          cubit.state,
          isA<WeatherState>()
              .having(
                (state) => state.buergerParkSaarbrueckenWeather,
                'buergerParkSaarbrueckenWeather',
                weather,
              )
              .having(
                (state) => state.iqbOfficeWeather,
                'iqbOfficeWeather',
                weather1,
              )
              .having(
                (state) => state.localWeather,
                'localWeather',
                weather2,
              ),
        );
      });

      test('has status idle when at least on cached weather available', () {
        when(
          () => weatherRepository.readWeather(
            location: WeatherLocation.buergerParkSaarbruecken,
          ),
        ).thenReturn(weather);
        when(
          () => weatherRepository.readWeather(
            location: WeatherLocation.iqbOffice,
          ),
        ).thenReturn(Weather.empty);
        when(
          () => weatherRepository.readWeather(
            location: WeatherLocation.local,
          ),
        ).thenReturn(Weather.empty);
        final cubit = WeatherCubit(weatherRepository: weatherRepository);
        expect(cubit.state.status, WeatherStatus.idle);
      });

      test('has status loading when no cached weather available', () {
        when(
          () => weatherRepository.readWeather(
            location: WeatherLocation.buergerParkSaarbruecken,
          ),
        ).thenReturn(Weather.empty);
        when(
          () => weatherRepository.readWeather(
            location: WeatherLocation.iqbOffice,
          ),
        ).thenReturn(Weather.empty);
        when(
          () => weatherRepository.readWeather(
            location: WeatherLocation.local,
          ),
        ).thenReturn(Weather.empty);
        final cubit = WeatherCubit(weatherRepository: weatherRepository);
        expect(cubit.state.status, WeatherStatus.loading);
      });
    });

    // TODO(jtdLab): implement

    // blocTest<WeatherCubit, WeatherState>(
    //   'emits fetched weathers 1-by-1 when viewLoaded is called',
    //   setUp: () {
    //     when(
    //       () => weatherRepository.fetchWeather(
    //         location: WeatherLocation.buergerParkSaarbruecken,
    //       ),
    //     ).thenAnswer((_) async => weather2);
    //     when(
    //       () => weatherRepository.fetchWeather(
    //         location: WeatherLocation.iqbOffice,
    //       ),
    //     ).thenAnswer((_) async => weather);
    //     when(
    //       () => weatherRepository.fetchWeather(location: WeatherLocation.local),
    //     ).thenAnswer((_) async => weather1);
    //   },
    //   build: () => WeatherCubit(weatherRepository: weatherRepository),
    //   seed: () => const WeatherState(status: WeatherStatus.loading),
    //   act: (cubit) => cubit.viewLoaded(),
    //   expect: () => [
    //     isA<WeatherState>().having(
    //       (state) => state.iqbOfficeWeather,
    //       'iqbOfficeWeather',
    //       weather,
    //     ),
    //     isA<WeatherState>().having(
    //       (state) => state.buergerParkSaarbrueckenWeather,
    //       'buergerParkSaarbrueckenWeather',
    //       weather2,
    //     ),
    //     isA<WeatherState>().having(
    //       (state) => state.localWeather,
    //       'localWeather',
    //       weather1,
    //     ),
    //   ],
    // );

    // blocTest<WeatherCubit, WeatherState>(
    //   'emits status [loading, loading, idle]',
    //   setUp: () {
    //     when(
    //       () => weatherRepository.fetchWeather(
    //         location: WeatherLocation.buergerParkSaarbruecken,
    //       ),
    //     ).thenAnswer((_) async => weather2);
    //     when(
    //       () => weatherRepository.fetchWeather(
    //         location: WeatherLocation.iqbOffice,
    //       ),
    //     ).thenAnswer((_) async => weather);
    //     when(
    //       () => weatherRepository.fetchWeather(location: WeatherLocation.local),
    //     ).thenAnswer((_) async => weather1);
    //   },
    //   build: () => WeatherCubit(weatherRepository: weatherRepository),
    //   seed: () => const WeatherState(status: WeatherStatus.loading),
    //   act: (cubit) => cubit.viewLoaded(),
    //   expect: () => [
    //     isA<WeatherState>().having(
    //       (state) => state.status,
    //       'status',
    //       WeatherStatus.loading,
    //     ),
    //     isA<WeatherState>().having(
    //       (state) => state.status,
    //       'status',
    //       WeatherStatus.loading,
    //     ),
    //     isA<WeatherState>().having(
    //       (state) => state.status,
    //       'status',
    //       WeatherStatus.idle,
    //     ),
    //   ],
    // );

    // blocTest<WeatherCubit, WeatherState>(
    //   'ignores failing fetches',
    //   setUp: () {
    //     when(
    //       () => weatherRepository.fetchWeather(
    //         location: WeatherLocation.buergerParkSaarbruecken,
    //       ),
    //     ).thenThrow(Exception());
    //     when(
    //       () => weatherRepository.fetchWeather(
    //         location: WeatherLocation.iqbOffice,
    //       ),
    //     ).thenThrow(Exception());
    //     when(
    //       () => weatherRepository.fetchWeather(location: WeatherLocation.local),
    //     ).thenAnswer((_) async => weather1);
    //   },
    //   build: () => WeatherCubit(weatherRepository: weatherRepository),
    //   seed: () => const WeatherState(status: WeatherStatus.loading),
    //   act: (cubit) => cubit.viewLoaded(),
    //   expect: () => [
    //     isA<WeatherState>().having(
    //       (state) => state.localWeather,
    //       'iqbOfficeWeather',
    //       weather1,
    //     ),
    //   ],
    // );

    blocPresentationTest<WeatherCubit, WeatherState, WeatherPresentationEvent>(
      'emits [WeatherRequestPermissions] when fetch local weather fails '
      'with FetchWeatherPermissionPermanentlyDeniedFailure',
      setUp: () {
        when(
          () => weatherRepository.fetchWeather(location: WeatherLocation.local),
        ).thenThrow(FetchWeatherPermissionPermanentlyDeniedFailure());
      },
      build: () => WeatherCubit(weatherRepository: weatherRepository),
      act: (cubit) => cubit.viewLoaded(),
      expectPresentation: () => [
        WeatherRequestPermissions(),
      ],
    );
  });
}
