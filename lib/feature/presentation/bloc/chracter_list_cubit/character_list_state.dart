import 'package:equatable/equatable.dart';
import 'package:rickandmortywiki/feature/domain/entities/character_entity.dart';

abstract class CharacterListState extends Equatable {
  const CharacterListState();

  @override
  List<Object?> get props => [];
}

class CharacterListEmptyState extends CharacterListState {}

class CharacterListLoadingState extends CharacterListState {
  final List<CharacterEntity> oldCharacters;
  final bool isFirstFetch;

  CharacterListLoadingState(this.oldCharacters, {this.isFirstFetch = false});

  @override
  List<Object?> get props => [oldCharacters];
}

class CharacterListLoadedState extends CharacterListState {
  final List<CharacterEntity> characters;

  CharacterListLoadedState({required this.characters});

  @override
  List<Object?> get props => [characters];
}

class CharacterListErrorState extends CharacterListState {
  final String message;

  CharacterListErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
