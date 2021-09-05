import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:rickandmortywiki/core/error/failure.dart';
import 'package:rickandmortywiki/core/usecases/use_case.dart';
import 'package:rickandmortywiki/feature/domain/entities/character_paginator_entity.dart';
import 'package:rickandmortywiki/feature/domain/repositories/character_repository.dart';

@LazySingleton()
class GetAllCharacters implements UseCase<CharacterPaginatorEntity, PageCharacterParams> {

  final CharacterRepository _characterRepository;

  GetAllCharacters(this._characterRepository);

  @override
  Future<Either<Failure, CharacterPaginatorEntity>> call(PageCharacterParams params) {
    return _characterRepository.getByPage(params.page);
  }

}

class PageCharacterParams extends Equatable {
  final int page;

  PageCharacterParams({required this.page});

  @override
  List<Object?> get props => [page];
}
