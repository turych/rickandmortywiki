// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i4;
import 'package:logger/logger.dart' as _i5;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import 'core/platform/network_Info.dart' as _i6;
import 'core/usecases/use_case.dart' as _i13;
import 'feature/data/repositories/characher_repository_impl.dart' as _i12;
import 'feature/data/sourses/character_local.dart' as _i8;
import 'feature/data/sourses/character_rest_client.dart' as _i9;
import 'feature/data/sourses/charaster_remote.dart' as _i10;
import 'feature/domain/entities/person_entity.dart' as _i14;
import 'feature/domain/repositories/character_repository.dart' as _i11;
import 'feature/domain/usecases/get_all_charchers.dart' as _i16;
import 'feature/domain/usecases/search_character.dart' as _i15;
import 'feature/presentation/bloc/chracter_list_cubit/character_list_cubit.dart'
    as _i17;
import 'feature/presentation/bloc/search_bloc/character_search_bloc.dart'
    as _i18;
import 'register_module.dart' as _i19; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.Dio>(() => registerModule.dio);
  gh.lazySingleton<_i4.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.lazySingleton<_i5.Logger>(() => registerModule.logger);
  gh.lazySingleton<_i6.NetworkInfo>(
      () => _i6.NetworkInfoImpl(get<_i4.InternetConnectionChecker>()));
  await gh.factoryAsync<_i7.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true);
  gh.factory<String>(() => registerModule.baseUrl, instanceName: 'BaseUrl');
  gh.lazySingleton<_i8.CharacterLocal>(
      () => _i8.CharacterLocalImpl(get<_i7.SharedPreferences>()));
  gh.lazySingleton<_i9.CharacterRestClient>(
      () => _i9.CharacterRestClient(get<_i3.Dio>(), baseUrl: get<String>()));
  gh.lazySingleton<_i10.CharacterRemote>(() => _i10.CharacterRemoteImpl(
      restClient: get<_i9.CharacterRestClient>(), logger: get<_i5.Logger>()));
  gh.lazySingleton<_i11.CharacterRepository>(() => _i12.CharacterRepositoryImpl(
      characterLocal: get<_i8.CharacterLocal>(),
      characterRemote: get<_i10.CharacterRemote>(),
      networkInfo: get<_i6.NetworkInfo>()));
  gh.lazySingleton<
          _i13.UseCase<List<_i14.CharacterEntity>, _i15.SearchCharacterParams>>(
      () => _i15.SearchCharacters(get<_i11.CharacterRepository>()),
      instanceName: 'SearchCharacters');
  gh.lazySingleton<
          _i13.UseCase<List<_i14.CharacterEntity>, _i16.PageCharacterParams>>(
      () => _i16.GetAllCharacters(get<_i11.CharacterRepository>()),
      instanceName: 'GetAllCharacters');
  gh.factory<_i17.CharacterListCubit>(() => _i17.CharacterListCubit(
      getAllCharacters: get<
          _i13.UseCase<List<_i14.CharacterEntity>,
              _i16.PageCharacterParams>>(instanceName: 'GetAllCharacters')));
  gh.factory<_i18.CharacterSearchBloc>(() => _i18.CharacterSearchBloc(
      searchCharacters: get<
          _i13.UseCase<List<_i14.CharacterEntity>,
              _i15.SearchCharacterParams>>(instanceName: 'SearchCharacters')));
  return get;
}

class _$RegisterModule extends _i19.RegisterModule {
  @override
  _i4.InternetConnectionChecker get internetConnectionChecker =>
      _i4.InternetConnectionChecker();
}
