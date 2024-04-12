import 'package:bmi_calculator/mainScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());
final ThemeData theme = ThemeData();

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
      },
    );
  }
}
