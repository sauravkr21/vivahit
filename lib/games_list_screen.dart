import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'game_model.dart';

Future<List<Game>> fetchGame() async {
  final response =
      await http.get(Uri.parse('https://www.mmobomb.com/api1/games'));
  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Game>((json) => Game.fromMap(json)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}

class GamesListScreen extends StatefulWidget {
  @override
  _GamesListScreenState createState() => _GamesListScreenState();
}

class _GamesListScreenState extends State<GamesListScreen> {
  final TextEditingController _filterController = TextEditingController();
  String _filter = '';
  String _platform = 'all';
  late Future<List<Game>> futureGame;
  @override
  void initState() {
    super.initState();
    futureGame = fetchGame();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VivaHit Games',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('VivaHit Games'),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  _filterController.clear();
                  _filter = '';
                  _platform = 'all';
                });
              },
              icon: Icon(Icons.clear),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    controller: _filterController,
                    decoration: InputDecoration(
                      hintText: 'Search by title',
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _filter = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: DropdownButton<String>(
                    value: _platform,
                    onChanged: (value) {
                      setState(() {
                        _platform = value!;
                      });
                    },
                    items: [
                      DropdownMenuItem(
                        value: 'all',
                        child: Text('All platforms'),
                      ),
                      DropdownMenuItem(
                        value: 'PC (Windows)',
                        child: Text('PC'),
                      ),
                      DropdownMenuItem(
                        value: 'Web Browser',
                        child: Text('Browser'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: FutureBuilder<List<Game>>(
          future: futureGame,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final games = snapshot.data!
                  .where((game) =>
                      _platform == 'all' || game.platform == _platform)
                  .where((game) =>
                      _filter.isEmpty ||
                      game.title.toLowerCase().contains(_filter.toLowerCase()))
                  .toList();
              return ListView.builder(
                itemCount: games.length,
                itemBuilder: (_, index) => Container(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Color(0xff97ffff),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${games[index].title}",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Image.network(
                          "${games[index].thumbnail}",
                          fit: BoxFit.cover,
                        ),
                        Text(
                          "${games[index].genre}",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${games[index].platform}",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "${games[index].release_date}",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('${snapshot.error}'));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
