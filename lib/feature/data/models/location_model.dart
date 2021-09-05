import 'package:json_annotation/json_annotation.dart';
import 'package:rickandmortywiki/feature/domain/entities/location_entity.dart';

part 'location_model.g.dart';

@JsonSerializable(createFactory: true, createToJson: true)
class LocationModel extends LocationEntity {

  LocationModel({
    required name, required url
  }) : super(
    name: name,
    url: url
  );

  factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);
  Map<String, dynamic> toJson() => _$LocationModelToJson(this);
}