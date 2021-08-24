import 'package:dartz/dartz.dart';
import 'package:rickandmortywiki/core/error/failure.dart';
import 'package:rickandmortywiki/feature/domain/entities/person_entity.dart';

abstract class CharacterRepository {
  Future<Either<Failure, List<CharacterEntity>>> getByPage(int page);
  Future<Either<Failure, List<CharacterEntity>>> search(String name);
}