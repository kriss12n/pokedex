import 'package:flutter/material.dart';

class CustomBadge extends StatelessWidget {
  final String type;
  final Color color;

  CustomBadge({this.type, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      width: 70,
      height: 20,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(50)),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 13.0),
          child: Text(
            "$type",
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
    );
  }
}
