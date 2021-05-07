import 'package:flutter/material.dart';
import 'package:pokedex/src/models/Pokedex.dart';
import 'package:pokedex/src/pages/pokemon_detail.dart';
import 'package:pokedex/src/widgets/customBadge.dart';
import 'package:pokedex/src/widgets/custom_title.dart';

import 'customBadge.dart';

class CustomCard extends StatelessWidget {
  final Pokedex pokemon;

  CustomCard(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => PokemonDetail()));
      },
      child: Container(
        width: 350,
        height: 150,
        decoration: BoxDecoration(
          color: returnBackColor(pokemon.types[0].type.name),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTittle(
                title: "${pokemon.name}",
                color: Colors.white,
                size: 16,
              ),
              Expanded(
                child: Row(
                  children: [
                    Column(
                      children: [
                        for (int i = 0; i < pokemon.types.length; i++)
                          CustomBadge(
                              type: pokemon.types[i].type.name,
                              color: returnBadgeColor(pokemon.types))
                      ],
                    ),
                    Hero(
                      tag: pokemon.id,
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Image(
                            image: NetworkImage(pokemon
                                .sprites.other.officialArtwork.frontDefault),
                            fit: BoxFit.fitWidth,
                            width: 90,
                            height: 80,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Color returnBackColor(String name) {
  switch (name) {
    case "grass":
      return Color(0xff48D0B0);
      break;
    case "fire":
      return Color(0xffFA6C6D);
    case "water":
      return Color(0xff7CBEFA);
    case "electric":
      return Color(0xffFAD054);
    default:
      return Color(0xff48D0B0);
  }
}

Color returnBadgeColor(List type) {
  if (type.first.type.name == "grass") return Color(0xff61E0CA);
  if (type.first.type.name == "fire") return Color(0xffFA8585);
  if (type.first.type.name == "water") return Color(0xff8FD1FE);
  if (type.first.type.name == "electric") return Color(0xffFED86F);
  return Color(0xff48D0B0);
}
