class Game {
  Game({
    required this.title,
    required this.thumbnail,
    required this.genre,
    required this.platform,
    required this.release_date,
  });
  final String title;
  final String thumbnail;
  final String genre;
  final String platform;
  final String release_date;

  factory Game.fromMap(Map<String, dynamic> json) => Game(
    title: json['title'],
    thumbnail: json['thumbnail'],
    genre: json['genre'],
    platform: json['platform'],
    release_date: json['release_date'],
  );
}