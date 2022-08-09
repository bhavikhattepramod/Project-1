import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart';

@JsonSerializable()
class Model {
  String field;
  String direction;
  Model(this.field, this.direction);
  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);
  Map<String, dynamic> toJson() => _$ModelToJson(this);
}
