import 'package:flutter/material.dart';

class CustomTittle extends StatelessWidget {
  final String title;
  final Color color;
  final double size;

  CustomTittle({this.title, this.color = Colors.black, this.size = 30.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.0),
      child: Text(
        "$title",
        style: TextStyle(
            color: color, fontWeight: FontWeight.bold, fontSize: size),
      ),
    );
  }
}
