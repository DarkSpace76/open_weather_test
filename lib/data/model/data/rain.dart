import 'package:json_annotation/json_annotation.dart';

part 'rain.g.dart';

@JsonSerializable()
class Rain {
  @JsonKey(name: '1h')
  double? h1;

  @JsonKey(name: '3h')
  double? h3;

  Rain({this.h1, this.h3});

  factory Rain.fromJson(Map<String, dynamic> json) => _$RainFromJson(json);

  Map<String, dynamic> toJson() => _$RainToJson(this);
}
