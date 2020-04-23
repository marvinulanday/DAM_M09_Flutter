import 'package:flutter/material.dart';
import 'package:flutterapp/models/Character.dart';
import 'package:provider/provider.dart';

class CharacterDetailsPage extends StatelessWidget {
  final int id;
  final String name;
  final String image;

  CharacterDetailsPage({this.id, this.name, this.image});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (ctx) => Character(id: id, name: name, imageDetail: image),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFFC22E28),
          title: Text(name,
            style: TextStyle(
              fontFamily: 'Bebas',
              fontSize: 21,
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Container(
              child: SizedBox(
                height: screenSize.shortestSide - 100,
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Hero(
                        tag: name,
                        child: Image.network(image, fit: BoxFit.contain),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Consumer<Character>(
                builder: (ctx, character, child) {
                  if (character.description == null) {
                    character.getCharacterDetails();
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return Container(
                      color: Colors.black,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(''),
                            Text(
                              'DESCRIPTION',
                              style: TextStyle(
                                fontFamily: 'Marvel',
                                fontSize: 18,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                character.description,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontFamily: 'Bebas',
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
