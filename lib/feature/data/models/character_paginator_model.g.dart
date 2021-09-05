// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_paginator_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterPaginatorModel _$CharacterPaginatorModelFromJson(
    Map<String, dynamic> json) {
  return CharacterPaginatorModel(
    results: (json['results'] as List<dynamic>)
        .map((e) => CharacterModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CharacterPaginatorModelToJson(
        CharacterPaginatorModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
