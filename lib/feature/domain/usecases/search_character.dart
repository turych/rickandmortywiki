import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:rickandmortywiki/core/error/failure.dart';
import 'package:rickandmortywiki/core/usecases/use_case.dart';
import 'package:rickandmortywiki/feature/domain/entities/character_paginator_entity.dart';
import 'package:rickandmortywiki/feature/domain/repositories/character_repository.dart';

@LazySingleton()
class SearchCharacters implements UseCase<CharacterPaginatorEntity, SearchCharacterParams> {

  final CharacterRepository _characterRepository;

  SearchCharacters(this._characterRepository);

  @override
  Future<Either<Failure, CharacterPaginatorEntity>> call(SearchCharacterParams params) {
    return _characterRepository.search(params.name);
  }

}

class SearchCharacterParams extends Equatable {
  final String name;

  SearchCharacterParams({required this.name});

  @override
  List<Object?> get props => [name];
}
