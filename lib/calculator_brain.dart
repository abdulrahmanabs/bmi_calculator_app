import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});
  final int weight;
  final int height;
  late double _bmiResult = 0.0;

  String GetBMIResult() {
    _bmiResult = weight / pow(height / 100, 2);
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