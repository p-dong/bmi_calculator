// ignore_for_file: prefer_const_constructors, deprecated_member_use, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          color: Color(0xFF212121),
        ),
        scaffoldBackgroundColor: Color(0xFF212121),
      ),
      home: InputPage(),
    );
  }
}
