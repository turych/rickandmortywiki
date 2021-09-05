import 'package:json_annotation/json_annotation.dart';
import 'package:rickandmortywiki/feature/data/models/character_model.dart';
import 'package:rickandmortywiki/feature/domain/entities/character_paginator_entity.dart';

part 'character_paginator_model.g.dart';

@JsonSerializable(createFactory: true, createToJson: true)
class CharacterPaginatorModel extends CharacterPaginatorEntity {

  final List<CharacterModel> results;

  CharacterPaginatorModel({
    required this.results
  }) : super(results: results);

  factory CharacterPaginatorModel.fromJson(Map<String, dynamic> json) =>
      _$CharacterPaginatorModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterPaginatorModelToJson(this);
}