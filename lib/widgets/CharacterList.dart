import 'package:flutter/material.dart';
import 'package:flutterapp/pages/CharacterDetailsPage.dart';
import 'package:flutterapp/view_models/CharacterViewModel.dart';

class CharacterList extends StatelessWidget {
  final List<CharacterViewModel> characters;

  CharacterList({this.characters});

  // Diseño de un Character de la lista
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.characters.length,
      itemBuilder: (context, index) {
        final character = this.characters[index];

        return ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(character.image)),
                borderRadius: BorderRadius.circular(6)),
            width: 50,
            height: 100,
          ),
          title: Text(
            character.name,
            style: TextStyle(
              fontFamily: 'Bebas',
              fontSize: 20,
            ),
          ),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () =>
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CharacterDetailsPage(
                              id: character.id,
                              name: character.name,
                              image: character.imageDetail))),
        );
      },
    );
  }
}
