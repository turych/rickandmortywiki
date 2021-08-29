import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:rickandmortywiki/core/exception/exception.dart';
import 'package:rickandmortywiki/feature/data/models/character_model.dart';
import 'package:rickandmortywiki/feature/data/sourses/character_rest_client.dart';

abstract class CharacterRemote {
  /// Throw a [ServerException] for all non 2** codes.
  Future<List<CharacterModel>> getByPage(int page);

  /// Throw a [ServerException] for all non 2** codes.
  Future<List<CharacterModel>> search(String name);
}

@LazySingleton(as: CharacterRemote)
class CharacterRemoteImpl implements CharacterRemote {
  final CharacterRestClient restClient;
  final Logger logger;

  CharacterRemoteImpl({required this.restClient, required this.logger});

  @override
  Future<List<CharacterModel>> getByPage(int page) async {
    try {
      return await restClient.getByPage(page);
    } catch (error) {
      final res = (error as DioError).response;
      logger.e("Got error : ${res?.statusCode} -> ${res?.statusMessage}");
      throw ServerException();
    }
  }

  @override
  Future<List<CharacterModel>> search(String name) async {
    try {
      return await restClient.search(name);
    } catch (error) {
      _logError((error as DioError));
      throw ServerException();
    }
  }

  void _logError(DioError dioError) {
    logger.i("rest url : ${dioError.requestOptions.uri.toString()}");
    logger.e(
        "Got error : ${dioError.response?.statusCode} -> ${dioError.response?.statusMessage}");
  }
}
