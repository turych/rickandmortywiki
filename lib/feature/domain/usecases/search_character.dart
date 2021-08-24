import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:rickandmortywiki/core/error/failure.dart';
import 'package:rickandmortywiki/core/usecases/use_case.dart';
import 'package:rickandmortywiki/feature/domain/entities/person_entity.dart';
import 'package:rickandmortywiki/feature/domain/repositories/character_repository.dart';

class SearchCharacters implements UseCase<List<CharacterEntity>, SearchCharacterParams> {

  final CharacterRepository _characterRepository;

  SearchCharacters(this._characterRepository);

  @override
  Future<Either<Failure, List<CharacterEntity>>> call(SearchCharacterParams params) {
    return _characterRepository.search(params.name);
  }

}

class SearchCharacterParams extends Equatable {
  final String name;

  SearchCharacterParams({required this.name});

  @override
  List<Object?> get props => [name];
}
