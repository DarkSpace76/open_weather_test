// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hour_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourWeather _$HourWeatherFromJson(Map<String, dynamic> json) => HourWeather(
      countHour: json['cnt'] as int?,
      list: HourWeather._jsonToList(json['list'] as List?),
      city: json['city'] == null
          ? null
          : City.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HourWeatherToJson(HourWeather instance) =>
    <String, dynamic>{
      'cnt': instance.countHour,
      'list': instance.list,
      'city': instance.city,
    };
