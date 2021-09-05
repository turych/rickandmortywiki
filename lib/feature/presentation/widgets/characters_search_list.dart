import 'package:flutter/material.dart';
import 'package:rickandmortywiki/feature/domain/entities/character_entity.dart';

import 'character_search_card.dart';

class CharactersSearchList extends StatelessWidget {
  final List<CharacterEntity> characters;

  const CharactersSearchList({Key? key, required this.characters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: _itemBuilder,
        separatorBuilder: (c, i) => SizedBox(height: 10,),
        itemCount: characters.length
    );
  }

  Widget _itemBuilder(BuildContext c, int i) {
    return CharacterSearchCard(character: characters[i]);
  }
}
