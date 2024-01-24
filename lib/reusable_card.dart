import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Widget cardChild;

  ReusableCard({required this.cardChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
            colors: [Colors.teal, Colors.grey.shade900], // colors: colour
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter),
      ),
    );
  }
}
