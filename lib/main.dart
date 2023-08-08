import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';
//import 'input_page.dart';

const mainAppColor = Color(0xFF0A0E21);

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: mainAppColor,
          appBarTheme: AppBarTheme(backgroundColor: mainAppColor),
          primaryColorDark: mainAppColor,
          primaryColor: mainAppColor),
      home: InputPage(),
    );
  }
}
