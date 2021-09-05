// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterModel _$CharacterModelFromJson(Map<String, dynamic> json) {
  return CharacterModel(
    id: json['id'],
    name: json['name'],
    status: json['status'],
    species: json['species'],
    type: json['type'],
    gender: json['gender'],
    origin: LocationModel.fromJson(json['origin'] as Map<String, dynamic>),
    location: LocationModel.fromJson(json['location'] as Map<String, dynamic>),
    image: json['image'],
    episode:
        (json['episode'] as List<dynamic>).map((e) => e as String).toList(),
    url: json['url'],
    created: json['created'],
  );
}

Map<String, dynamic> _$CharacterModelToJson(CharacterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'species': instance.species,
      'type': instance.type,
      'gender': instance.gender,
      'image': instance.image,
      'url': instance.url,
      'created': instance.created,
      'origin': instance.origin,
      'location': instance.location,
      'episode': instance.episode,
    };
