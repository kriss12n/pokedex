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
    final size = MediaQuery.of(context).size;

    return LayoutBuilder(builder: (context, constraint) {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "detail", arguments: pokemon);
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
              child: Stack(
                children: [
                  Positioned(
                    right: -35,
                    bottom: -35,
                    width: 135,
                    child: Image(
                      image: AssetImage("assets/img/pokeball.png"),
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                  Column(
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
                                  Container(
                                    margin: EdgeInsets.only(top: 5),
                                    width: constraint.maxWidth * 0.35,
                                    height: constraint.maxHeight * 0.15,
                                    decoration: BoxDecoration(
                                        color: returnBadgeColor(pokemon.types),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child:
                                        CustomBadge(pokemon.types[i].type.name),
                                  )
                              ],
                            ),
                            Hero(
                              tag: pokemon.id,
                              child: Container(
                                child: Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Image(
                                    image: NetworkImage(pokemon.sprites.other
                                        .officialArtwork.frontDefault),
                                    fit: BoxFit.contain,
                                    width: constraint.maxWidth * 0.45,
                                    height: constraint.maxHeight * 1,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
                clipBehavior: Clip.none,
              )),
        ),
      );
    });
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
    case "bug":
      return Color(0xff9CAE1A);
    case "normal":
      return Color(0xff9D9B6B);
    default:
      return Color(0xff48D0B0);
  }
}

Color returnBadgeColor(List type) {
  if (type.first.type.name == "grass") return Color(0xff61E0CA);
  if (type.first.type.name == "fire") return Color(0xffFA8585);
  if (type.first.type.name == "water") return Color(0xff8FD1FE);
  if (type.first.type.name == "electric") return Color(0xffFED86F);
  if (type.first.type.name == "bug") return Color(0xffAEBD3F);
  if (type.first.type.name == "normal") return Color(0xffAAAB82);
  return Color(0xff48D0B0);
}
