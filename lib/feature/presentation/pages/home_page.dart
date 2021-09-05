import 'package:flutter/material.dart';
import 'package:rickandmortywiki/feature/presentation/widgets/character_search_delegate.dart';
import 'package:rickandmortywiki/feature/presentation/widgets/characters_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Characters"),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: CharacterSearchDelegate());
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: CharactersList(),
    );
  }
}
