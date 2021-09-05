import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmortywiki/feature/presentation/bloc/chracter_list_cubit/character_list_cubit.dart';
import 'package:rickandmortywiki/feature/presentation/bloc/search_bloc/character_search_bloc.dart';
import 'package:rickandmortywiki/feature/presentation/pages/home_page.dart';

import 'di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.configureDependencies();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CharacterSearchBloc>(
          create: (c) => di.getIt<CharacterSearchBloc>(),
        ),
        BlocProvider<CharacterListCubit>(
          create: (c) => di.getIt<CharacterListCubit>()..loadCharacters(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          appBarTheme: AppBarTheme(backgroundColor: Colors.grey.shade900),
          scaffoldBackgroundColor: Colors.blueGrey.shade900,
          textTheme: TextTheme(
            bodyText1: TextStyle(),
            bodyText2: TextStyle(),
          ).apply(
            bodyColor: Colors.blueGrey.shade50,
            displayColor: Colors.blueGrey.shade50,
          ),
        ),
        home: HomePage(),
      ),
    );
  }
}
