import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'package:rickandmortywiki/feature/data/models/character_model.dart';

part 'character_rest_client.g.dart';

@RestApi(baseUrl: "https://rickandmortyapi.com/api/")
abstract class CharacterRestClient {

  factory CharacterRestClient(Dio dio, {String baseUrl}) = _CharacterRestClient;

  @GET("character")
  @Headers(<String, dynamic>{
    "Content-Type" : "application/json",
    "Custom-Header" : "Your header"
  })
  Future<List<CharacterModel>> search(@Query("name") String name);

  @GET("character")
  @Headers(<String, dynamic>{
    "Content-Type" : "application/json",
  })
  Future<List<CharacterModel>> getByPage(@Query("page") int page);
}