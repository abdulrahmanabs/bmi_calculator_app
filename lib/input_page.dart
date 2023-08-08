import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/main.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'bottom_button.dart';
import 'reusable_card.dart';
import 'card_child.dart';
import 'constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int currentHeight = 130;
  int currentWeight = 20;
  int currentAge = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: CardChild(
                      icon: FontAwesomeIcons.mars,
                      text: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild:
                        CardChild(icon: FontAwesomeIcons.venus, text: "FEMALE"),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HEIGHT", style: kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currentHeight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        "CM",
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbColor: kSliderActiveColour,
                        inactiveTrackColor: Colors.white,
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        activeTrackColor: kSliderActiveColour,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 20),
                        overlayColor: Color.fromARGB(76, 218, 18, 78)),
                    child: Slider(
                      min: 110,
                      max: 220,
                      value: currentHeight.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          currentHeight = value.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            currentWeight.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    currentWeight--;
                                  });
                                },
                              ),
                              SizedBox(width: 20),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      currentWeight++;
                                    });
                                  })
                            ],
                          )
                        ]),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: kLabelTextStyle,
                          ),
                          Text(
                            currentAge.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    currentAge--;
                                  });
                                },
                              ),
                              SizedBox(width: 20),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      currentAge++;
                                    });
                                  })
                            ],
                          )
                        ]),
                  ),
                )
              ],
            ),
          ),
          BottomButton(
            text: "CALCULATE",
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(
                  height: currentHeight,
                  weight: currentWeight.toDouble(),
                  age: currentAge,
                  gender: selectedGender);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                        bmiResult: calc.GetBMIResult(),
                        Advice: calc.GetAdvice(),
                        result: calc.getResult()),
                  ));
            },
          )
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});
  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0,
      fillColor: Color.fromARGB(255, 58, 56, 145),
      child: Center(child: Icon(icon, size: 35)),
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
    );
  }
}
