import 'dart:convert';
import 'dart:developer';

import 'package:bloc_fetch_api/models/game.dart';
import 'package:http/http.dart' as http;

class GameSource {
  Future<List<GameModel>?> fetchGameApi() async {
    const nameUrl = 'https://www.freetogame.com/api/games';
    try {
      final response = await http.get(Uri.parse(nameUrl));
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        List<GameModel> listGame =
            data.map((e) => GameModel.fromJson(e)).toList();
        return listGame;
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
