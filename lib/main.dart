import 'package:bmi_calculator/input_page.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
//import 'input_page.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kMainAppColor,
          appBarTheme: AppBarTheme(backgroundColor: kMainAppColor),
          primaryColorDark: kMainAppColor,
          primaryColor: kMainAppColor),
      home: InputPage(),
    );
  }
}
