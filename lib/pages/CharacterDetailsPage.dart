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
        appBar: AppBar(
          title: Text(name),
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
                        child: FittedBox(
                          child: Image.network(image, fit: BoxFit.contain),
                          fit: BoxFit.fill,
                        ),
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
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  character.description,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            )
                          ],
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
