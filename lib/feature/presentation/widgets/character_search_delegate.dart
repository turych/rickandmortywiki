import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmortywiki/feature/presentation/bloc/search_bloc/character_search_bloc.dart';
import 'package:rickandmortywiki/feature/presentation/bloc/search_bloc/character_search_event.dart';
import 'package:rickandmortywiki/feature/presentation/bloc/search_bloc/character_search_state.dart';
import 'package:rickandmortywiki/feature/presentation/widgets/characters_search_list.dart';

class CharacterSearchDelegate extends SearchDelegate {
  final _suggestions = ["Rick", "Morty", "Summer", "Beth", "Jerry"];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
          showSuggestions(context);
        },
        icon: Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    BlocProvider.of<CharacterSearchBloc>(context, listen: false)
      ..add(CharacterSearchEvent(searchQuery: query));

    return BlocBuilder<CharacterSearchBloc, SearchState>(
      builder: (context, state) {
        if (state is CharacterLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CharacterLoadedState) {
          if (state.characters.isEmpty) {
            return Text("Not found.");
          }
          return CharactersSearchList(characters: state.characters);
        } else if (state is CharacterFailureState) {
          return Text("Not found.");
        }

        return Center(child: Icon(Icons.now_wallpaper));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.separated(
      itemCount: _suggestions.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
              onTap: () {
                query = _suggestions[index];
                showResults(context);
              },
              child: Text(_suggestions[index]),
          ),
        );
      },
      separatorBuilder: (context, index) => Divider(),
    );
  }
}
