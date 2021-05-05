import 'package:flutter/material.dart';
import 'package:pokedex/src/pages/pokemon_detail.dart';
import 'package:pokedex/src/pages/pokemons_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: PokemonsPage());
  }
}
