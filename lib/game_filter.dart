import 'dart:convert';

import 'package:http/http.dart' as http;
import 'game_model.dart';

class ApiService {
  static const _baseUrl = 'https://www.mmobomb.com/api1/games';

  static Future<List<Game>> fetchGames(String platform) async {
    final url = Uri.parse(_baseUrl + '?platform=$platform');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> gamesJson = json.decode(response.body);
      return gamesJson.map((json) => Game.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch games');
    }
  }

}