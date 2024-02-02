import 'package:bmi_calculator/constants.dart';
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

  double calculateBMI(int height, int weight, String gender, int age) {
    // convert height from cm to m
    double heightInMeters = height / 100.0;

    // calculate BMI
    double bmi = weight / (heightInMeters * heightInMeters);

    // adjust the bmi based on gender
    if (gender.toLowerCase() == 'male') {
      // Apply the male-specific factor
      bmi *= 1.1;
    } else if (gender.toLowerCase() == 'female') {
      // Apply the female-specific factor
      bmi *= 0.9;
    }

    // Adjust the BMI based on age
    if (age < 18) {
      // Apply a factor for younger individuals
      bmi *= 1.2;
    } else if (age >= 18 && age <= 64) {
      // Apply a slight adjustment for middle-aged individuals
      bmi *= 1.05; // You can experiment with different factors here
    } else if (age >= 65) {
      // Apply a factor for older individuals
      bmi *= 1.1;
    }

    return bmi;
  }

  String getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return 'UNDERWEIGHT';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'NORMAL WEIGHT';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'OVERWEIGHT';
    } else {
      return 'OBESE';
    }
  }

  String getComment(double bmi) {
    if (bmi < 18.5) {
      return 'You are underweight. Consider consulting with a healthcare professional.';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Congratulations! You have a normal weight.';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'You are overweight. Consider adopting a healthier lifestyle.';
    } else {
      return 'You are obese. It is recommended to consult with a healthcare professional.';
    }
  }

  @override
  Widget build(BuildContext context) {
    double bmi = calculateBMI(height, weight, gender, age);
    String category = getBMICategory(bmi);
    String comment = getComment(bmi);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Your Result',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: kActiveCardColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    category,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmi.toStringAsFixed(1),
                    style: TextStyle(
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    comment,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // navigate back to the input page
              Navigator.pop(context);
            },
            child: Text(
              'Re - Calculate',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: kBottomContainerColor,
              minimumSize: Size(double.infinity, kBottomContainerHeight),
            ),
          ),
        ],
      ),
    );
  }
}
