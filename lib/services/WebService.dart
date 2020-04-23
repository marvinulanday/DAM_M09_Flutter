import 'dart:convert';

import 'package:flutterapp/models/Character.dart';
import 'package:http/http.dart' as http;

class Webservice {

  /// Peticion a la API de Marvel para recoger los datos de Character
  Future<List<Character>> fetchCharacters(int limit, int offset) async {
    final String apiKey = "e4b0d7c00f5097eedd37274cc1ea06a2";
    final String hash = "7f5a67612a19e7505104b271f1a96652";
    final url = "https://gateway.marvel.com/v1/public/characters?apikey=$apiKey&hash=$hash&limit=$limit&offset=$offset&ts=9";
    final response = await http.get(url);
    if(response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body["data"]["results"];
        return json.map((character) => Character.fromJson(character)).toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }

  /// Peticion a la API de Marvel para recoger los datos de un Character especifico
  static Future<Character> getCharacter(Character character) async {
    final String apiKey = "e4b0d7c00f5097eedd37274cc1ea06a2";
    final String hash = "7f5a67612a19e7505104b271f1a96652";
    final url = "https://gateway.marvel.com/v1/public/characters/"+character.id.toString()+"?apikey=$apiKey&hash=$hash&ts=9";
    final response = await http.get(url);
    if(response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body["data"]["results"];
      character.description = json.elementAt(0)["description"];
      if(character.description == ""){
        character.description = "There is no description of this character";
      }
      return character;
    } else {
      throw Exception("Unable to perform request!");
    }
  }


}