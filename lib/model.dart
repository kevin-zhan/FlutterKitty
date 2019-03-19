import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

@JsonSerializable(nullable: false)
class KittyModel {
  final String id;
  final String url;

  KittyModel({this.id, this.url});

  factory KittyModel.fromJson(Map<String, dynamic> json) => _$KittyModelFromJson(json);

  Map<String, dynamic> toJson() => _$KittyModelToJson(this);
}