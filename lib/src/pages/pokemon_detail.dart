import 'package:flutter/material.dart';
import 'package:pokedex/src/models/Pokedex.dart';
import 'package:pokedex/src/models_view/Pokedex.dart';
import 'package:pokedex/src/widgets/custom_appbarDetail.dart';
import 'package:pokedex/src/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'dart:math' as Math;

class PokemonDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Pokedex pokemon = ModalRoute.of(context).settings.arguments;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: returnBackColor(pokemon.types[0].type.name),
        child: Stack(
          children: [
            _UpDetail(pokemon),
            _DownDetail(),
            ContainerImage(pokemon),
          ],
        ),
      ),
    );
  }
}

class _UpDetail extends StatelessWidget {
  final Pokedex pokemon;
  _UpDetail(this.pokemon);
  @override
  Widget build(BuildContext context) {
    final scaleFactor = MediaQuery.of(context).textScaleFactor;

    final double _opacityBody = Provider.of<PokedexView>(context).opacityBody;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        margin: EdgeInsets.only(top: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppbarDetail(name: pokemon.name, id: pokemon.id),
            AnimatedOpacity(
                opacity: _opacityBody,
                duration: Duration(milliseconds: 300),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTittle(title: pokemon.name, color: Colors.white),
                    Spacer(),
                    Text(
                      "#${pokemon.id}".toString(),
                      style: TextStyle(
                          fontSize: 20 * scaleFactor,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                )),
            SizedBox(
              height: 10.0,
            ),
            AnimatedOpacity(
                opacity: _opacityBody,
                duration: Duration(milliseconds: 300),
                child: getTypes(pokemon.types)),
          ],
        ),
      ),
    );
  }
}

class ContainerImage extends StatelessWidget {
  final Pokedex pokemon;
  ContainerImage(this.pokemon);
  @override
  Widget build(BuildContext context) {
    final _opacityImage = Provider.of<PokedexView>(context).opacityImage;
    return LayoutBuilder(builder: (context, constraint) {
      return AnimatedOpacity(
          opacity: _opacityImage,
          duration: Duration(milliseconds: 300),
          child: Stack(
            children: [
              Align(
                heightFactor: 3.0,
                alignment: Alignment.center,
                child: BackgroundAnimation(),
              ),
              Positioned(
                left: constraint.maxWidth * 0.25,
                top: constraint.maxHeight * 0.39,
                child: Container(
                  width: constraint.maxWidth * 0.5,
                  child: Hero(
                    tag: pokemon.id,
                    child: Image(
                      image: NetworkImage(
                          pokemon.sprites.other.officialArtwork.frontDefault),
                      fit: BoxFit.contain,
                      height: constraint.maxHeight * 0.25,
                      width: constraint.maxWidth * 0.25t,
                    ),
                  ),
                ),
              )
            ],
          ));
    });
  }
}

class BackgroundAnimation extends StatefulWidget {
  @override
  _BackgroundAnimationState createState() => _BackgroundAnimationState();
}

class _BackgroundAnimationState extends State<BackgroundAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> rotation;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
    rotation = Tween(begin: 0.0, end: 1 * Math.pi).animate(controller);

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.repeat();
    return AnimatedBuilder(
      animation: controller,
      child: Container(
        height: 400,
        width: 400,
        child: Image(
          image: AssetImage("assets/img/pokeball.png"),
          color: Colors.white.withOpacity(0.3),
        ),
      ),
      builder: (BuildContext context, child) {
        return Transform.rotate(angle: rotation.value, child: child);
      },
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
    final pokedexProvider = Provider.of<PokedexView>(context);

    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (notification) {
        pokedexProvider.viewport = notification.extent;
        return true;
      },
      child: DraggableScrollableSheet(
        initialChildSize: 0.41,
        minChildSize: 0.41,
        maxChildSize: 0.9,
        expand: true,
        builder: (BuildContext context, scrollController) {
          return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0))),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                controller: scrollController,
              ));
        },
      ),
    );
  }
}

Widget getTypes(List<Type> types) {
  List<Widget> list = [];
  for (var i = 0; i < types.length; i++) {
    list.add(CustomBadge(types[i].type.name));
    list.add(SizedBox(
      width: 10.0,
    ));
  }
  return new Row(children: list);
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
// margin: EdgeInsets.only(top: 160),
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(45.0),
//                 topRight: Radius.circular(45.0),
//               )),
//           child: Padding(
//             padding:
//                 const EdgeInsets.symmetric(vertical: 30.0, horizontal: 30.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 CustomTabBar(
//                   _controller,
//                 ),
//                 TabBarView(
//                   children: [
//                     AboutTab(),
//                     Container(
//                       child: Text("2"),
//                     ),
//                     Container(
//                       child: Text("3"),
//                     ),
//                     Container(
//                       child: Text("4"),
//                     )
//                   ],
//                   controller: _controller,
//                 ),
//               ],
//             ),
//           ),
