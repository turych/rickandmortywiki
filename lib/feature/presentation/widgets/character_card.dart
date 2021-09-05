import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rickandmortywiki/feature/domain/entities/character_entity.dart';
import 'package:rickandmortywiki/feature/presentation/pages/character_details_page.dart';
import 'package:rickandmortywiki/feature/presentation/widgets/cached_image.dart';
import 'package:rickandmortywiki/feature/presentation/widgets/character_status.dart';

class CharacterCard extends StatelessWidget {
  final CharacterEntity character;

  CharacterCard(this.character);

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
            CachedImage(url: character.image, width: 150, height: 150),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      character.name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    if (character.species != "unknown") Text(character.species),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Origin:",
                      style: TextStyle(color: Colors.blueGrey.shade200),
                    ),
                    Text(character.origin.name),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          "Status: ",
                          style: TextStyle(color: Colors.blueGrey.shade200),
                        ),
                        CharacterStatus(status: character.status)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
