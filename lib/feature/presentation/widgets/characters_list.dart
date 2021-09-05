import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmortywiki/feature/domain/entities/character_entity.dart';
import 'package:rickandmortywiki/feature/presentation/bloc/chracter_list_cubit/character_list_cubit.dart';
import 'package:rickandmortywiki/feature/presentation/bloc/chracter_list_cubit/character_list_state.dart';

import 'character_card.dart';

class CharactersList extends StatelessWidget {
  final scrollController = ScrollController();

  void _setupScrollController(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.offset == scrollController.position.maxScrollExtent) {
          context.read<CharacterListCubit>().loadCharacters();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _setupScrollController(context);
    return BlocBuilder<CharacterListCubit, CharacterListState>(
        builder: (context, state) {
      if (state is CharacterListEmptyState) {
        context.read<CharacterListCubit>().loadCharacters();
        return _loadingIndicator();
      }

      List<CharacterEntity> characters = [];
      bool isLoading = false;

      if (state is CharacterListLoadingState && state.isFirstFetch) {
        isLoading = true;
        return _loadingIndicator();
      } else if (state is CharacterListLoadingState) {
        characters = state.oldCharacters;
        isLoading = true;
      } else if (state is CharacterListErrorState) {
        return Text(state.message);
      }
      if (state is CharacterListLoadedState) {
        characters = state.characters;
        isLoading = false;
      }

      return ListView.separated(
          controller: scrollController,
          itemBuilder: (context, index) {
            if (index < characters.length) {
              return CharacterCard(characters[index]);
            } else {
              Timer(Duration(milliseconds: 30), () {
                scrollController
                    .jumpTo(scrollController.position.maxScrollExtent);
              });
              return _loadingIndicator();
            }
          },
          separatorBuilder: (c, i) => _separatorBuilder(c, i),
          itemCount: characters.length + (isLoading ? 1 : 0),
      );
    });
  }

  Widget _separatorBuilder(BuildContext context, int index) {
    return Container(
      height: 10,
    );
  }

  Widget _loadingIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
