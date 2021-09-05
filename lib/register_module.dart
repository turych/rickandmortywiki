import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {

  @Named("baseUrl")
  String get baseUrl => 'https://rickandmortyapi.com/api/';

  @lazySingleton
  Dio get dio => Dio();

  @lazySingleton
  Connectivity get internetConnectionChecker;

  @lazySingleton
  Logger get logger => Logger();

  @preResolve
  Future<SharedPreferences> get sharedPreferences => SharedPreferences.getInstance();
}
