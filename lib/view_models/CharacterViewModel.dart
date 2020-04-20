import 'package:flutterapp/models/Character.dart';

class CharacterViewModel {

  final Character character;

  CharacterViewModel({this.character});

  int get id {
    return this.character.id;
  }

  String get name {
    return this.character.name;
  }

  String get description {
    return this.character.description;
  }

  String get image {
    return this.character.image;
  }

  String get imageDetail {
    return this.character.imageDetail;
  }

}