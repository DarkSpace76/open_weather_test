// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'snow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Snow _$SnowFromJson(Map<String, dynamic> json) => Snow(
      h1: (json['1h'] as num?)?.toDouble(),
      h3: (json['3h'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SnowToJson(Snow instance) => <String, dynamic>{
      '1h': instance.h1,
      '3h': instance.h3,
    };
