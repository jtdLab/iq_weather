import 'package:flutter_test/flutter_test.dart';
import 'package:iq_weather/repositories/weather/weather.dart';
import 'package:iq_weather/weather_details/weather_details.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

void main() {
  group(WeatherDetailsCubit, () {
    late WeatherRepository weatherRepository;

    setUp(() {
      weatherRepository = MockWeatherRepository();
    });

    test('initial state takes cached weather from repository', () {
      const location = WeatherLocation.iqbOffice;
      when(() => weatherRepository.readWeather(location: location))
          .thenReturn(weather);
      final cubit = WeatherDetailsCubit(
        weatherRepository: weatherRepository,
        location: location,
      );
      expect(
        cubit.state,
        WeatherDetailsState(location: location, weather: weather),
      );
    });
  });
}
