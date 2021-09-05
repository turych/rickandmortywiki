import 'package:flutter/material.dart';
import 'package:rickandmortywiki/feature/domain/entities/character_entity.dart';
import 'package:rickandmortywiki/feature/presentation/pages/character_details_page.dart';
import 'package:rickandmortywiki/feature/presentation/widgets/cached_image.dart';

class CharacterSearchCard extends StatelessWidget {
  final CharacterEntity character;

  const CharacterSearchCard({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CharacterDetailsPage(character: character),
          ),
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            CachedImage(url: character.image, width: 100, height: 100),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  character.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
