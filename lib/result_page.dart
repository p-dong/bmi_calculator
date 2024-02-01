import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int height;
  final int weight;
  final int age;
  final String gender;

  ResultPage(
      {required this.height,
      required this.weight,
      required this.age,
      required this.gender});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Text('Height: $height cm'),
          Text('Weight: $weight kg'),
          Text('Age: $age years'),
          Text('Gender: $gender'),
        ],
      ),
    );
  }
}
