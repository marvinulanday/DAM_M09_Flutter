import 'package:flutter/material.dart';
import 'package:flutterapp/pages/CharacterDetailsPage.dart';
import 'package:flutterapp/pages/CharacterListPage.dart';
import 'package:flutterapp/view_models/CharacterListViewModel.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of   your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Characters",
        routes: {
          "/info": (ctx) => CharacterDetailsPage(),
        },
        home:
        ChangeNotifierProvider(
          create: (context) => CharacterListViewModel(),
          child: CharacterListPage(),
        )
    );
  }
}
