import 'package:flutter/cupertino.dart';
import 'package:pokedex/src/models/Pokedex.dart';
import 'package:http/http.dart' as http;

class PokedexServices with ChangeNotifier {
  List<Pokedex> pokemones = [];

  PokedexServices() {
    this.getPokemons();
  }

  getPokemons() async {
    for (int i = 1; i <= 20; i++) {
      final url = Uri.https('pokeapi.co', "/api/v2/pokemon/$i");
      final resp = await http.get(url);
      final pokedexResponse = pokedexFromJson(resp.body);
      this.pokemones.add(pokedexResponse);
      notifyListeners();
    }
  }
}
