import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Row(
        children: [
          Icon(Icons.arrow_back_sharp),
          Spacer(),
          Icon(Icons.list_sharp)
        ],
      ),
    );
  }
}
