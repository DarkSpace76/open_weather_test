// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rain _$RainFromJson(Map<String, dynamic> json) => Rain(
      h1: (json['1h'] as num?)?.toDouble(),
      h3: (json['3h'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$RainToJson(Rain instance) => <String, dynamic>{
      '1h': instance.h1,
      '3h': instance.h3,
    };
