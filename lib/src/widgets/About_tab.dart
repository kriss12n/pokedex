import 'package:flutter/material.dart';

class AboutTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _UpData()),
          SizedBox(
            height: 15.0,
          ),
          Text(
            "Breading",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8.0,
          ),
          Expanded(child: _DownData()),
        ],
      ),
    );
  }
}

class _UpData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _Labels(
          label: "Species",
          data: "Seed",
        ),
        _Labels(
          label: "Height",
          data: "2'3.6* (70.0 cm)",
        ),
        _Labels(
          label: "Weight",
          data: "15.2 lbs (6.9 kg)",
        ),
        _Labels(
          label: "Abilities",
          data: "Overgrow,Chlorophyl",
        ),
      ],
    );
  }
}

class _DownData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _Labels(
          label: "Gender",
          data: "Male",
        ),
        _Labels(
          label: "Egg Groups",
          data: "Monster",
        ),
        _Labels(
          label: "Egg Cycle",
          data: "Grass",
        ),
      ],
    );
  }
}

class _Labels extends StatelessWidget {
  final String label;
  final String data;

  _Labels({
    this.label,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 80,
          child: Text(
            "$label",
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.black54),
          ),
        ),
        SizedBox(width: 50.0),
        Text(
          "$data",
          textAlign: TextAlign.justify,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
