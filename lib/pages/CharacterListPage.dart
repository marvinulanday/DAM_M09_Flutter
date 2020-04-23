import 'package:flutter/material.dart';
import 'package:flutterapp/view_models/CharacterListViewModel.dart';
import 'package:flutterapp/widgets/CharacterList.dart';
import 'package:provider/provider.dart';


class CharacterListPage extends StatefulWidget {
  @override
  _CharacterListPageState createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {

  @override
  void initState() {
    super.initState();
    //Pido los primeros 20 Characters
    Provider.of<CharacterListViewModel>(context, listen: false).fetchCharacters(10,0);
    Provider.of<CharacterListViewModel>(context, listen: false).fetchCharacters(10,10);
  }

  @override
  Widget build(BuildContext context) {
    //Aqui recojo los datos pedidos anteriormente y los muestro por pantalla
    var vm = Provider.of<CharacterListViewModel>(context);
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xFFC22E28),
            title: Text("Characters from Marvel",
              style: TextStyle(
                fontFamily: 'Bebas',
                fontSize: 21,
              ),
            )
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