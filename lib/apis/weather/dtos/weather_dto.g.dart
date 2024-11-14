// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDto _$WeatherDtoFromJson(Map<String, dynamic> json) => WeatherDto(
      temperature: (json['temperature'] as num?)?.toDouble(),
      precipitation: (json['precipitation_10'] as num?)?.toInt(),
      humidity: (json['relative_humidity'] as num?)?.toInt(),
      icon: json['icon'] as String?,
    );

Map<String, dynamic> _$WeatherDtoToJson(WeatherDto instance) =>
    <String, dynamic>{
      'temperature': instance.temperature,
      'precipitation_10': instance.precipitation,
      'relative_humidity': instance.humidity,
      'icon': instance.icon,
    };
