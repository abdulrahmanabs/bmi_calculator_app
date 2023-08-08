import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'card_child.dart';

final bottomContainerHeight = 80;
final activeCardColour = Color.fromARGB(255, 61, 64, 107);
final inActiveCardColour = Color(0xFF1D1E33);
final bottomContainerColour = Color(0xFFEB1555);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

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
                  child: ReusableWidget(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? activeCardColour
                        : inActiveCardColour,
                    cardChild: CardChild(
                      icon: FontAwesomeIcons.mars,
                      text: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableWidget(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? activeCardColour
                        : inActiveCardColour,
                    cardChild:
                        CardChild(icon: FontAwesomeIcons.venus, text: "FEMALE"),
                  ),
                )
              ],
            ),
          ),
          Expanded(child: ReusableWidget(colour: activeCardColour)),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableWidget(colour: activeCardColour),
                ),
                Expanded(
                  child: ReusableWidget(colour: activeCardColour),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 80,
            color: bottomContainerColour,
          )
        ],
      ),
    );
  }
}
