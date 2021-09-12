import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/controllers/calculation.dart';
import 'package:bmi_calculator/views/bottom_button.dart';
import 'package:bmi_calculator/views/data_cards.dart';
import 'package:bmi_calculator/views/icon_content.dart';
import 'package:bmi_calculator/views/result_page.dart';
import 'package:bmi_calculator/views/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectGender = Gender.male;
  int height = 160;
  int weight = 60;
  int age = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectGender = Gender.male;
                      });
                    },
                    colour: selectGender == Gender.male
                        ? activeCardColour
                        : inActiveCardColour,
                    cardChild: const IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                      colour: iconColor,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectGender = Gender.female;
                      });
                    },
                    colour: selectGender == Gender.female
                        ? activeCardColour
                        : inActiveCardColour,
                    cardChild: const IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                      colour: iconColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          DataCards(
            dataName: "HEIGHT",
            data: height,
            unitName: "cm",
            sliderMin: 0,
            sliderMax: 250,
            onChanged: (double newValue) {
              setState(() {
                height = newValue.round();
              });
            },
          ),
          DataCards(
            dataName: "WEIGHT",
            data: weight,
            unitName: "kg",
            sliderMin: 0,
            sliderMax: 150,
            onChanged: (double newValue) {
              setState(() {
                weight = newValue.round();
              });
            },
          ),
          DataCards(
            dataName: "AGE",
            data: age,
            unitName: "years",
            sliderMin: 0,
            sliderMax: 100,
            onChanged: (double newValue) {
              setState(() {
                age = newValue.round();
              });
            },
          ),
          BottomButton(
            onTap: () {
              Calculator cal = Calculator(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: cal.calculateBMI(),
                    resultText: cal.getResult(),
                    advice: cal.advice(),
                    colour: cal.getColour(),
                  ),
                ),
              );
            },
            text: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 8.0,
      constraints: const BoxConstraints.tightFor(
        width: 55.0,
        height: 55.0,
      ),
      shape: const CircleBorder(),
      fillColor: iconColor,
    );
  }
}
