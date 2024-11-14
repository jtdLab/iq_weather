import 'package:flutter_test/flutter_test.dart';
import 'package:iq_weather/apis/weather/dtos/source_dto.dart';
import 'package:iq_weather/apis/weather/dtos/weather_dto.dart';
import 'package:iq_weather/apis/weather/messages/get_current_weather/get_current_weather_response.dart';

void main() {
  group(GetCurrentWeatherResponse, () {
    test('can be (de)serialized', () {
      const instance = GetCurrentWeatherResponse(
        weather: WeatherDto(
          temperature: 24,
          precipitation: 11,
          humidity: 56,
          icon: 'clear-day',
        ),
        sources: [
          SourceDto(distance: 1820),
        ],
      );
      expect(
        GetCurrentWeatherResponse.fromJson(instance.toJson()).toJson(),
        equals(instance.toJson()),
      );
    });

    test('can be (de)serialized (empty)', () {
      const instance = GetCurrentWeatherResponse(
        weather: WeatherDto(
          temperature: null,
          precipitation: null,
          humidity: null,
          icon: null,
        ),
        sources: [],
      );
      expect(
        GetCurrentWeatherResponse.fromJson(instance.toJson()).toJson(),
        equals(instance.toJson()),
      );
    });
  });
}
