import 'package:equatable/equatable.dart';
import 'package:rickandmortywiki/feature/domain/entities/person_entity.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

class CharacterEmptyState extends SearchState {}

class CharacterLoadingState extends SearchState {}

class CharacterLoadedState extends SearchState {
  final List<CharacterEntity> characters;

  CharacterLoadedState({required this.characters});

  @override
  List<Object?> get props => [characters];
}

class CharacterFailureState extends SearchState {
  final String message;

  CharacterFailureState({required this.message});

  @override
  List<Object?> get props => [message];
}
