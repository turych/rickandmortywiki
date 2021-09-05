import 'package:dartz/dartz.dart';
import 'package:rickandmortywiki/core/error/failure.dart';
import 'package:rickandmortywiki/feature/domain/entities/character_paginator_entity.dart';

abstract class CharacterRepository {
  Future<Either<Failure, CharacterPaginatorEntity>> getByPage(int page);
  Future<Either<Failure, CharacterPaginatorEntity>> search(String name);
}