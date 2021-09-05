import 'package:equatable/equatable.dart';
import 'package:rickandmortywiki/feature/domain/entities/character_entity.dart';

class CharacterPaginatorEntity extends Equatable {
  final List<CharacterEntity> results;

  const CharacterPaginatorEntity({required this.results});

  @override
  List<Object?> get props => [results];
}