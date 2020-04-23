import 'package:flutter/cupertino.dart';
import 'package:flutterapp/services/WebService.dart';

// Modelo Character con los atributos correspondientes
class Character extends ChangeNotifier {
  final int id;
  final String name;
  String description;
  final String image;
  final String imageDetail;

  Character({this.id, this.name, this.description, this.image, this.imageDetail});

  //Cogerá los datos del json y los pondrá en el atributo correspondiente
  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['thumbnail']['path']+"/portrait_small."+json['thumbnail']['extension'],
      imageDetail: json['thumbnail']['path']+"/portrait_fantastic."+json['thumbnail']['extension']
    );
  }

  // Pedirá de nuevo los datos del Character
  Future<Character> getCharacterDetails() async {
    await Webservice.getCharacter(this);
    notifyListeners();
    return this;
  }
}