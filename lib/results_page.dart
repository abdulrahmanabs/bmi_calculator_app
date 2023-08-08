import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.bmiResult, required this.Advice, required this.result});
  final String bmiResult, result, Advice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI CALCULATOR")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "YOUR RESULT",
                style: kTitleStyle,
              ),
            ),
          ),
          Expanded(
              flex: 6,
              child: ReusableCard(
                colour: Color.fromARGB(255, 29, 39, 94),
                onPressed: () {},
                cardChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      result,
                      style: TextStyle(
                          color: Color.fromARGB(255, 87, 248, 38),
                          fontSize: 40),
                    ),
                    Text(bmiResult, style: kNumberTextStyle),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        textAlign: TextAlign.center,
                        Advice,
                        style: kLabelTextStyle,
                      ),
                    )
                  ],
                ),
              )),
          BottomButton(
              onTap: () => Navigator.pop(context), text: "RE-CALCULATE")
        ],
      ),
    );
  }
}
