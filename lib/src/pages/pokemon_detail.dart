import 'package:flutter/material.dart';
import 'package:pokedex/src/widgets/custom_appbarDetail.dart';
import 'package:pokedex/src/widgets/widgets.dart';

class PokemonDetail extends StatelessWidget {
  const PokemonDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Color(0xff48D0B0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _UpDetail(),
              SizedBox(height: 20.0),
              Expanded(child: _DownDetail())
            ],
          ),
        ),
      ),
    );
  }
}

class _UpDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppbarDetail(),
          CustomTittle(title: "Bulbasaur", color: Colors.white),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              CustomBadge(type: "Grass", color: Color(0xff5DDFC7)),
              SizedBox(
                width: 10.0,
              ),
              CustomBadge(type: "Poison", color: Color(0xff5DDFC7))
            ],
          ),
        ],
      ),
    );
  }
}

class _DownDetail extends StatefulWidget {
  @override
  __DownDetailState createState() => __DownDetailState();
}

class __DownDetailState extends State<_DownDetail>
    with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(initialIndex: 0, length: 4, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            margin: EdgeInsets.only(top: 160),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45.0),
                  topRight: Radius.circular(45.0),
                )),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
              child: Column(
                children: [
                  CustomTabBar(
                    _controller,
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        AboutTab(),
                        Container(
                          child: Text("2"),
                        ),
                        Container(
                          child: Text("3"),
                        ),
                        Container(
                          child: Text("4"),
                        )
                      ],
                      controller: _controller,
                    ),
                  )
                ],
              ),
            )),
        Hero(
          tag: 1,
          child: Container(
            width: double.infinity,
            height: 200,
            child: Center(
              child: Image(
                image: NetworkImage(
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
