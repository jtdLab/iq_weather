// ignore_for_file: prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:hive/hive.dart';
import 'package:iq_weather/apis/weather/weather_api.dart';
import 'package:iq_weather/repositories/weather/weather.dart';
import 'package:iq_weather/temperature/temperature.dart';
import 'package:iq_weather/weather/weather.dart';
import 'package:iq_weather/weather_details/weather_details.dart';
import 'package:mocktail/mocktail.dart';

import 'helpers/helpers.dart';

class MockTemperatureCubit extends MockCubit<TemperatureUnit>
    implements TemperatureCubit {
  MockTemperatureCubit({
    super.initialState = TemperatureUnit.celsius,
    super.stream,
  });
}

class MockWeatherCubit
    extends MockPresentationCubit<WeatherState, WeatherPresentationEvent>
    implements WeatherCubit {
  MockWeatherCubit({
    super.initialState = const WeatherState(status: WeatherStatus.idle),
    super.stream,
    super.initialEvents,
  });
}

class MockWeatherDetailsCubit extends MockCubit<WeatherDetailsState>
    implements WeatherDetailsCubit {
  MockWeatherDetailsCubit({
    super.initialState = const WeatherDetailsState(
      location: WeatherLocation.local,
      weather: Weather.empty,
    ),
    super.stream,
  });
}

class MockDio extends Mock implements Dio {}

class MockResponse<T> extends Mock implements Response<T> {}

class MockWeatherApi extends Mock implements WeatherApi {}

class MockGeolocator extends Mock implements Geolocator {}

class MockPosition extends Mock implements geo.Position {
  MockPosition({
    required double latitude,
    required double longitude,
  }) {
    when(() => this.latitude).thenReturn(latitude);
    when(() => this.longitude).thenReturn(longitude);
  }
}

class MockBox<T> extends Mock implements Box<T> {}

class MockWeatherRepository extends Mock implements WeatherRepository {
  MockWeatherRepository() {
    when(() => readWeather(location: WeatherLocation.buergerParkSaarbruecken))
        .thenReturn(weather);
    when(() => readWeather(location: WeatherLocation.iqbOffice))
        .thenReturn(weather1);
    when(() => readWeather(location: WeatherLocation.local))
        .thenReturn(weather2);
    when(() => fetchWeather(location: WeatherLocation.buergerParkSaarbruecken))
        .thenAnswer((_) async => weather2);
    when(() => fetchWeather(location: WeatherLocation.iqbOffice))
        .thenAnswer((_) async => weather);
    when(() => fetchWeather(location: WeatherLocation.local))
        .thenAnswer((_) async => weather1);
  }
}

final weather = Weather(
  temperature: 17.6,
  precipitation: 0,
  humidity: 62,
  distanceToWeatherStation: 16364,
  icon: WeatherIcon.cloudy,
);

final weather1 = Weather(
  temperature: 30,
  precipitation: 0,
  humidity: 20,
  distanceToWeatherStation: 5000,
  icon: WeatherIcon.fog,
);

final weather2 = Weather(
  temperature: -11,
  precipitation: 11,
  humidity: 10,
  distanceToWeatherStation: 1000,
  icon: WeatherIcon.snow,
);

final rawGetCurrentWeatherResponse = <String, dynamic>{
  'weather': {
    'source_id': 238685,
    'timestamp': '2023-08-07T12:30:00+00:00',
    'cloud_cover': 100,
    'condition': 'dry',
    'dew_point': 10.14,
    'solar_10': 0.081,
    'solar_30': 0.207,
    'solar_60': 0.48,
    'precipitation_10': 0,
    'precipitation_30': 0,
    'precipitation_60': 0,
    'pressure_msl': 1013.6,
    'relative_humidity': 62,
    'visibility': 43128,
    'wind_direction_10': 280,
    'wind_direction_30': 287,
    'wind_direction_60': 285,
    'wind_speed_10': 27.4,
    'wind_speed_30': 26.6,
    'wind_speed_60': 29.2,
    'wind_gust_direction_10': 270,
    'wind_gust_direction_30': 270,
    'wind_gust_direction_60': 270,
    'wind_gust_speed_10': 37.8,
    'wind_gust_speed_30': 37.8,
    'wind_gust_speed_60': 54.4,
    'sunshine_30': 2,
    'sunshine_60': 22,
    'temperature': 17.6,
    'fallback_source_ids': <dynamic>{},
    'icon': 'cloudy',
  },
  'sources': [
    {
      'id': 238685,
      'dwd_station_id': '01766',
      'observation_type': 'synop',
      'lat': 52.1344,
      'lon': 7.69686,
      'height': 47.8,
      'station_name': 'Muenster/Osnabrueck',
      'wmo_station_id': '10315',
      'first_record': '2023-08-06T06:30:00+00:00',
      'last_record': '2023-08-07T12:30:00+00:00',
      'distance': 16364,
    }
  ],
};
