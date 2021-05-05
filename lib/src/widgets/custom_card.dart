import 'package:flutter/material.dart';
import 'package:pokedex/src/pages/pokemon_detail.dart';
import 'package:pokedex/src/widgets/customBadge.dart';
import 'package:pokedex/src/widgets/custom_title.dart';

class CustomCard extends StatelessWidget {
  final int index;

  CustomCard(this.index);

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
          color: Color(0xff48D0B0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTittle(
                title: "Bulbasaur",
                color: Colors.white,
                size: 16,
              ),
              Expanded(
                child: Row(
                  children: [
                    Column(
                      children: [
                        CustomBadge(
                          type: "Grass",
                          color: Color(0xff5DDFC7),
                        ),
                        CustomBadge(
                          type: "Poison",
                          color: Color(0xff5DDFC7),
                        )
                      ],
                    ),
                    Hero(
                      tag: index,
                      child: Container(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Image(
                            image: NetworkImage(
                                "https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png"),
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
