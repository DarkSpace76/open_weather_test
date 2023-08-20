// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hour_weather_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourWeatherItem _$HourWeatherItemFromJson(Map<String, dynamic> json) =>
    HourWeatherItem(
      dt: HourWeatherItem._unixToDateTime(json['dt'] as int?),
      main: json['main'] == null
          ? null
          : Main.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>?)
          ?.map((e) => Weather.fromJson(e as Map<String, dynamic>))
          .toList(),
      wind: json['wind'] == null
          ? null
          : Wind.fromJson(json['wind'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HourWeatherItemToJson(HourWeatherItem instance) =>
    <String, dynamic>{
      'dt': HourWeatherItem._dateTimeToUnix(instance.dt),
      'main': instance.main,
      'weather': instance.weather,
      'wind': instance.wind,
    };
