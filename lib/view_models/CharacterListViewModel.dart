import 'package:flutter/foundation.dart';
import 'package:flutterapp/services/WebService.dart';
import 'package:flutterapp/view_models/CharacterViewModel.dart';

class CharacterListViewModel extends ChangeNotifier {

  List<CharacterViewModel> characters = List<CharacterViewModel>();

  /// Peticion a la API de Marvel para recoger los datos de Character y serán añadidos a la List
  Future<void> fetchCharacters(int limit, int offset) async {
    final results =  await Webservice().fetchCharacters(limit, offset);
    this.characters.addAll(results.map((item) => CharacterViewModel(character: item)).toList());
    notifyListeners();
  }

}