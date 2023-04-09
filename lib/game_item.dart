import 'package:flutter/material.dart';

import 'game_model.dart';


class GameItem extends StatelessWidget {

  final Game game;

  const GameItem({required this.game});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(game.title),
      subtitle: Text(game.platform),
    );
  }
}
