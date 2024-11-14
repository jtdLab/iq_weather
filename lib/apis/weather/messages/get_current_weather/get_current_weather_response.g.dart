// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_current_weather_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCurrentWeatherResponse _$GetCurrentWeatherResponseFromJson(
        Map<String, dynamic> json) =>
    GetCurrentWeatherResponse(
      weather: WeatherDto.fromJson(json['weather'] as Map<String, dynamic>),
      sources: (json['sources'] as List<dynamic>)
          .map((e) => SourceDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCurrentWeatherResponseToJson(
        GetCurrentWeatherResponse instance) =>
    <String, dynamic>{
      'weather': instance.weather.toJson(),
      'sources': instance.sources.map((e) => e.toJson()).toList(),
    };
