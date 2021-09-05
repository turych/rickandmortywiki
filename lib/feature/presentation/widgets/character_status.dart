import 'package:flutter/material.dart';

class CharacterStatus extends StatelessWidget {

  final String status;

  const CharacterStatus({Key? key, required this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      status,
      style: TextStyle(
        color: status == "Alive"
            ? Colors.greenAccent
            : (status == "Dead"
            ? Colors.redAccent
            : Colors.grey),
      ),
    );
  }
}