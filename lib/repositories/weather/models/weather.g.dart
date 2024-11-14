// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherAdapter extends TypeAdapter<Weather> {
  @override
  final int typeId = 0;

  @override
  Weather read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Weather(
      temperature: fields[0] as double?,
      precipitation: fields[1] as int?,
      humidity: fields[2] as int?,
      distanceToWeatherStation: fields[3] as int,
      icon: fields[4] as WeatherIcon?,
    );
  }

  @override
  void write(BinaryWriter writer, Weather obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.temperature)
      ..writeByte(1)
      ..write(obj.precipitation)
      ..writeByte(2)
      ..write(obj.humidity)
      ..writeByte(3)
      ..write(obj.distanceToWeatherStation)
      ..writeByte(4)
      ..write(obj.icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class WeatherIconAdapter extends TypeAdapter<WeatherIcon> {
  @override
  final int typeId = 2;

  @override
  WeatherIcon read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return WeatherIcon.clearDay;
      case 1:
        return WeatherIcon.clearNight;
      case 2:
        return WeatherIcon.partlyCloudyDay;
      case 3:
        return WeatherIcon.partlyCloudyNight;
      case 4:
        return WeatherIcon.cloudy;
      case 5:
        return WeatherIcon.fog;
      case 6:
        return WeatherIcon.wind;
      case 7:
        return WeatherIcon.rain;
      case 8:
        return WeatherIcon.sleet;
      case 9:
        return WeatherIcon.snow;
      case 10:
        return WeatherIcon.hail;
      case 11:
        return WeatherIcon.thunderstorm;
      default:
        return WeatherIcon.clearDay;
    }
  }

  @override
  void write(BinaryWriter writer, WeatherIcon obj) {
    switch (obj) {
      case WeatherIcon.clearDay:
        writer.writeByte(0);
        break;
      case WeatherIcon.clearNight:
        writer.writeByte(1);
        break;
      case WeatherIcon.partlyCloudyDay:
        writer.writeByte(2);
        break;
      case WeatherIcon.partlyCloudyNight:
        writer.writeByte(3);
        break;
      case WeatherIcon.cloudy:
        writer.writeByte(4);
        break;
      case WeatherIcon.fog:
        writer.writeByte(5);
        break;
      case WeatherIcon.wind:
        writer.writeByte(6);
        break;
      case WeatherIcon.rain:
        writer.writeByte(7);
        break;
      case WeatherIcon.sleet:
        writer.writeByte(8);
        break;
      case WeatherIcon.snow:
        writer.writeByte(9);
        break;
      case WeatherIcon.hail:
        writer.writeByte(10);
        break;
      case WeatherIcon.thunderstorm:
        writer.writeByte(11);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherIconAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
