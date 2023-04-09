import 'package:flutter/material.dart';
import 'games_list_screen.dart';


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
      title: 'VivaHit Games',
      home: GamesListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
