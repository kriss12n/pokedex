import 'package:flutter/material.dart';
import 'package:pokedex/src/models_view/Pokedex.dart';
import 'package:pokedex/src/pages/pokemon_detail.dart';
import 'package:pokedex/src/pages/pokemons_page.dart';
import 'package:pokedex/src/services/pokedex_services.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PokedexServices()),
        ChangeNotifierProvider(create: (_) => PokedexView())
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        initialRoute: "home",
        routes: {
          "home": (BuildContext context) => PokemonsPage(),
          "detail": (BuildContext context) => PokemonDetail(),
        },
      ),
    );
  }
}
