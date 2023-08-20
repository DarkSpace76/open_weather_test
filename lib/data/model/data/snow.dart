import 'package:json_annotation/json_annotation.dart';

part 'snow.g.dart';

@JsonSerializable()
class Snow {
  @JsonKey(name: '1h')
  double? h1;

  @JsonKey(name: '3h')
  double? h3;

  Snow({this.h1, this.h3});

  factory Snow.fromJson(Map<String, dynamic> json) => _$SnowFromJson(json);

  Map<String, dynamic> toJson() => _$SnowToJson(this);
}
