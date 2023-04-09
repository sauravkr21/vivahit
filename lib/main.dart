import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'games_list_screen.dart';
import 'game_model.dart';

void main() {
  runApp(GamesListApp());
}

class GamesListApp extends StatefulWidget {

  @override
  _GamesListAppState createState() => _GamesListAppState();
}

class _GamesListAppState extends State<GamesListApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Games List',
      home: GamesListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
