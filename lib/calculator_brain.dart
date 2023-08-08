import 'dart:math';

import 'package:bmi_calculator/input_page.dart';

class CalculatorBrain {
  CalculatorBrain(
      {required this.height,
      required this.weight,
      required this.age,
      required this.gender});
  final double weight;
  final int height;
  final int age;
  final Gender? gender;
  late double _bmiResult = 0.0;

  String GetBMIResult() {
    double heightInMeters = height / 100.0;
    double adjustedWeight = weight;

    if (gender == Gender.female) {
      adjustedWeight -= 0.5;
    } else if (gender == Gender.male) {
      adjustedWeight += 0.5;
    }

    double ageFactor = 1.0;
    if (age >= 18 && age <= 24) {
      ageFactor = 1.0;
    } else if (age >= 25 && age <= 34) {
      ageFactor = 0.95;
    } else if (age >= 35 && age <= 44) {
      ageFactor = 0.9;
    } else if (age >= 45 && age <= 54) {
      ageFactor = 0.85;
    } else if (age >= 55 && age <= 64) {
      ageFactor = 0.8;
    } else if (age >= 65) {
      ageFactor = 0.75;
    } else if (age < 18) {
      ageFactor =
          0.9; // Adjust the factor as per your requirements for ages under 18
    }

    _bmiResult = adjustedWeight / pow(heightInMeters, 2) * ageFactor;
    return _bmiResult.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmiResult >= 25) {
      return "OVERWEIGHT";
    } else if (_bmiResult > 18.5) {
      return "NORMAL";
    } else {
      return "UNDERWEIGHT";
    }
  }

  String GetAdvice() {
    if (_bmiResult >= 30) {
      return "You are obese. It's important to consult a healthcare professional.";
    } else if (_bmiResult >= 25) {
      return "You are overweight. Consider adopting a healthier lifestyle.";
    } else if (_bmiResult >= 18.5) {
      return "You have a normal body weight. Great job!";
    } else {
      return "You are underweight. Ensure you have a balanced diet and consult a healthcare professional if needed.";
    }
  }
}
