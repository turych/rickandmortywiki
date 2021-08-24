import 'dart:convert';

import 'package:rickandmortywiki/core/exception/exception.dart';
import 'package:rickandmortywiki/feature/data/models/character_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CharacterLocal {
  /// Throw a [CacheException] if cache is empty.
  Future<void> putIntoStorage(List<CharacterModel> characters);

  /// Throw a [CacheException] if cache is empty.
  Future<List<CharacterModel>> getFromStorage();
}

class CharacterApiSourceImpl implements CharacterLocal {
  static const CACHE_CHARACTERS_LIST = "CACHE_CHARACTERS_LIST";
  final SharedPreferences localStorage;

  CharacterApiSourceImpl(this.localStorage);

  @override
  Future<List<CharacterModel>> getFromStorage() {
    final fromStorage = localStorage.getStringList(CACHE_CHARACTERS_LIST);
    if (fromStorage != null && fromStorage.isNotEmpty) {
      return Future.value(fromStorage
          .map((e) => CharacterModel.fromJson(json.decode(e)))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> putIntoStorage(List<CharacterModel> characters) {
    final List<String> toStorage =
        characters.map((e) => json.encode(e.toJson())).toList();
    localStorage.setStringList(CACHE_CHARACTERS_LIST, toStorage);
    return Future.value(toStorage);
  }
}
