import 'dart:convert';
List<Game> postFromJson(String str) =>
    List<Game>.from(json.decode(str).map((x) => Game.fromMap(x)));

class Game {
  Game({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.short_description,
    required this.game_url,
    required this.genre,
    required this.platform,
    required this.publisher,
    required this.developer,
    required this.release_date,
    required this.profile_url,
  });
  final int id;
  final String title;
  final String thumbnail;
  final String short_description;
  final String game_url;
  final String genre;
  final String platform;
  final String publisher;
  final String developer;
  final String release_date;
  final String profile_url;

  factory Game.fromMap(Map<String, dynamic> json) => Game(
    id: json['id'],
    title: json['title'],
    thumbnail: json['thumbnail'],
    short_description: json['short_description'],
    game_url: json['game_url'],
    genre: json['genre'],
    platform: json['platform'],
    publisher:json['publisher'] ,
    developer: json['developer'],
    release_date: json['release_date'],
    profile_url: json['profile_url']
  );
  factory Game.fromJson(Map<String, dynamic> json) => Game(
      id: json['id'],
      title: json['title'],
      thumbnail: json['thumbnail'],
      short_description: json['short_description'],
      game_url: json['game_url'],
      genre: json['genre'],
      platform: json['platform'],
      publisher:json['publisher'] ,
      developer: json['developer'],
      release_date: json['release_date'],
      profile_url: json['profile_url']
  );


}