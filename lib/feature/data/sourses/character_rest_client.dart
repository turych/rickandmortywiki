import 'package:dio/dio.dart' hide Headers;
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rickandmortywiki/feature/data/models/character_paginator_model.dart';

part 'character_rest_client.g.dart';

@lazySingleton
@RestApi()
abstract class CharacterRestClient {

  @factoryMethod
  factory CharacterRestClient(Dio dio, {@Named("baseUrl") required String baseUrl}) = _CharacterRestClient;

  @GET("character")
  @Headers(<String, dynamic>{
    "Content-Type" : "application/json"
  })
  Future<CharacterPaginatorModel> search(@Query("name") String name);

  @GET("character")
  @Headers(<String, dynamic>{
    "Content-Type" : "application/json"
  })
  Future<CharacterPaginatorModel> getByPage(@Query("page") int page);
}