import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:rickandmortywiki/di.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<GetIt> configureDependencies() async => await $initGetIt(getIt);
