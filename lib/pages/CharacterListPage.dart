import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutterapp/view_models/CharacterListViewModel.dart';
import 'package:flutterapp/widgets/CharacterList.dart';


class CharacterListPage extends StatefulWidget {
  @override
  _CharacterListPageState createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {

  @override
  void initState() {
    super.initState();
    Provider.of<CharacterListViewModel>(context, listen: false).fetchCharacters(10,0);
    Provider.of<CharacterListViewModel>(context, listen: false).fetchCharacters(10,10);
  }

  @override
  Widget build(BuildContext context) {

    var vm = Provider.of<CharacterListViewModel>(context);

    return Scaffold(
        appBar: AppBar(
            title: Text("Characters from Marvel")
        ),
        body: Container(
            padding: EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
              Expanded(
                  child: CharacterList(characters: vm.characters)
              ),
            ])
        )

    );
  }
}