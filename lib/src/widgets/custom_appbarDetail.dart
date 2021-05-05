import 'package:flutter/material.dart';

class CustomAppbarDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_sharp,
              color: Colors.white,
            ),
          ),
          Spacer(),
          Icon(
            Icons.favorite_outline,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
