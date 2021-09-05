import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rickandmortywiki/feature/domain/entities/character_entity.dart';
import 'package:rickandmortywiki/feature/presentation/widgets/cached_image.dart';
import 'package:rickandmortywiki/feature/presentation/widgets/character_status.dart';

class CharacterDetailsPage extends StatelessWidget {
  final CharacterEntity character;

  const CharacterDetailsPage({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 10,),
              CachedImage(url: character.image, width: 300, height: 300),
              SizedBox(height: 10,),
              CharacterStatus(status: character.status),
              ..._buildText("Species", character.species),
              if (character.type.isNotEmpty) ..._buildText("Subspecies", character.type),
              ..._buildText("Gender", character.gender),
              ..._buildText("Origin", character.origin.name),
              ..._buildText("Last known location", character.location.name),
              ..._buildText("Episodes", character.episode.length.toString()),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildText(String label, String text) {
    return [
        SizedBox(height: 10,),
        Text(
          label,
          style: TextStyle(color: Colors.blueGrey.shade200),
        ),
        Text(text),
      ];
  }
}
