import 'package:flutter/material.dart';

class CustomBadge extends StatelessWidget {
  final String type;

  CustomBadge(this.type);

  @override
  Widget build(BuildContext context) {
    final scaleFactor = MediaQuery.of(context).textScaleFactor;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.0),
        child: Text(
          "$type",
          style: TextStyle(color: Colors.white, fontSize: 12 * scaleFactor),
        ),
      ),
    );
  }
}
