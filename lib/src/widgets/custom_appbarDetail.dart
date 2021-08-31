import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/src/models_view/Pokedex.dart';
import 'package:pokedex/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

class CustomAppbarDetail extends StatelessWidget {
  final String name;
  final int id;
  CustomAppbarDetail({this.name, this.id});
  @override
  Widget build(BuildContext context) {
    final _opacityNav = Provider.of<PokedexView>(context).opacityNav;
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_sharp,
              color: Colors.white,
            ),
          ),
          AnimatedOpacity(
            opacity: _opacityNav,
            duration: Duration(milliseconds: 300),
            child: Text(
              name,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          AnimatedOpacity(
            opacity: _opacityNav,
            duration: Duration(milliseconds: 300),
            child: Text(
              "#$id",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
