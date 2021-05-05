import 'dart:ui';

import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final TabController _controller;

  CustomTabBar(this._controller);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelPadding: EdgeInsets.all(0),
      labelColor: Colors.black,
      labelStyle: TextStyle(fontSize: 13),
      tabs: [
        Tab(text: "About"),
        Tab(text: "Base Stats"),
        Tab(text: "Evolution"),
        Tab(text: "Moves"),
      ],
      controller: _controller,
    );
  }
}
