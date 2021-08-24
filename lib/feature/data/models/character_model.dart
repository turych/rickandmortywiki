import 'package:json_annotation/json_annotation.dart';
import 'package:rickandmortywiki/feature/data/models/location_model.dart';
import 'package:rickandmortywiki/feature/domain/entities/person_entity.dart';

part 'character_model.g.dart';

@JsonSerializable()
class CharacterModel extends CharacterEntity {

  final LocationModel origin;
  final LocationModel location;

  CharacterModel({
    required id,
    required name,
    required status,
    required species,
    required type,
    required gender,
    required this.origin,
    required this.location,
    required image,
    required episode,
    required url,
    required created
  }) : super(
    id: id,
    name: name,
    status: status,
    species: species,
    type: type,
    gender: gender,
    origin: origin,
    location: location,
    image: image,
    episode: episode,
    url: url,
    created: created
  );

  factory CharacterModel.fromJson(Map<String, dynamic> json) => _$CharacterModelFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterModelToJson(this);
}