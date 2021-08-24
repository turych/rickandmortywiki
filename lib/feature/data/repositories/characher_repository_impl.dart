import 'package:dartz/dartz.dart';
import 'package:rickandmortywiki/core/error/failure.dart';
import 'package:rickandmortywiki/core/exception/exception.dart';
import 'package:rickandmortywiki/core/platform/network_Info.dart';
import 'package:rickandmortywiki/feature/data/models/character_model.dart';
import 'package:rickandmortywiki/feature/data/sourses/character_local.dart';
import 'package:rickandmortywiki/feature/data/sourses/charaster_api.dart';
import 'package:rickandmortywiki/feature/domain/entities/person_entity.dart';
import 'package:rickandmortywiki/feature/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterLocal characterLocal;
  final CharacterApi characterApi;
  final NetworkInfo networkInfo;

  CharacterRepositoryImpl({
    required this.characterLocal,
    required this.characterApi,
    required this.networkInfo
  });

  @override
  Future<Either<Failure, List<CharacterEntity>>> getByPage(int page) async {
    return await _getCharacters(() => characterApi.getByPage(page));
  }

  @override
  Future<Either<Failure, List<CharacterEntity>>> search(String name) async {
    return await _getCharacters(() => characterApi.search(name));
  }

  Future<Either<Failure, List<CharacterEntity>>> _getCharacters(
      Future<List<CharacterModel>> Function() getCharacters) async {
    if (await networkInfo.isConnected) {
      try {
        final characters = await getCharacters();
        characterLocal.putIntoStorage(characters);
        return Right(characters);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final characters = await characterLocal.getFromStorage();
        return Right(characters);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
