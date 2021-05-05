import 'package:flutter/material.dart';
import 'package:pokedex/src/widgets/custom_appbar.dart';
import 'package:pokedex/src/widgets/custom_card.dart';
import 'package:pokedex/src/widgets/custom_title.dart';

class PokemonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                child: GridView(
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 3 / 2),
                  children: [
                    CustomCard(1),
                    CustomCard(2),
                    CustomCard(3),
                    CustomCard(4),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
