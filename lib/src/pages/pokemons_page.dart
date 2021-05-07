import 'package:flutter/material.dart';
import 'package:pokedex/src/services/pokedex_services.dart';
import 'package:pokedex/src/widgets/custom_appbar.dart';
import 'package:pokedex/src/widgets/custom_card.dart';
import 'package:pokedex/src/widgets/custom_title.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_card.dart';

class PokemonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pokedexService = Provider.of<PokedexServices>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomAppbar(),
              CustomTittle(title: "Pokedex"),
              SizedBox(height: 25.0),
              Expanded(
                child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 3 / 2),
                  itemCount: pokedexService.pokemones.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomCard(pokedexService.pokemones[index]);
                  },
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
