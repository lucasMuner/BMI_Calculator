import 'package:bmi_calculator/resultScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bottomButton.dart';
import 'calculator_brain.dart';
import 'constants.dart';
import 'custom_card.dart';
import 'iconButton.dart';
import 'icon_content.dart';

enum Gender { Masculino, Feminino }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int cardColorMale = colorCardActive;
  int cardColorFemale = colorCardActive;
  int height = 180;
  int age = 20;
  int weight = 60;

  void changeStateCard(Gender gender) {
    gender == Gender.Masculino && cardColorMale == colorCardActive
        ? cardColorMale = colorCardInactive
        : cardColorMale = colorCardActive;

    gender == Gender.Feminino && cardColorFemale == colorCardActive
        ? cardColorFemale = colorCardInactive
        : cardColorFemale = colorCardActive;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CustomCard(
                    onPressed: () {
                      setState(() {
                        changeStateCard(Gender.Masculino);
                      });
                    },
                    margin: marginCard,
                    color: cardColorMale,
                    borderRad: borderRadCard,
                    cardChild: IconContent(
                      text: 'MASCULINO',
                      sizeIcon: sizeIcon,
                      sizeText: sizeText,
                      iconData: FontAwesomeIcons.mars,
                      colorText: textColor,
                    ),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    onPressed: () {
                      setState(() {
                        changeStateCard(Gender.Feminino);
                      });
                    },
                    margin: marginCard,
                    color: cardColorFemale,
                    borderRad: borderRadCard,
                    cardChild: IconContent(
                      text: 'FEMININO',
                      sizeIcon: sizeIcon,
                      sizeText: sizeText,
                      iconData: FontAwesomeIcons.venus,
                      colorText: textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CustomCard(
                    margin: marginCard,
                    color: colorCardActive,
                    borderRad: borderRadCard,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("ALTURA", style: labelTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: numberTextStyle,
                            ),
                            Text(
                              'CM',
                              style: labelTextStyle,
                            ),
                          ],
                        ),
                        Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          inactiveColor: Color(0xFF8D8E98),
                          activeColor: Color(0xFFEB1555),
                          onChanged: (double value) {
                            setState(
                              () {
                                height = value.round();
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CustomCard(
                    margin: marginCard,
                    color: colorCardActive,
                    borderRad: borderRadCard,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'PESO',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    margin: marginCard,
                    color: colorCardActive,
                    borderRad: borderRadCard,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'IDADE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(
                                  () {
                                    age--;
                                  },
                                );
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULAR',
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(height, weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultScreen(
                    bmiResults: calc.calculateBmi(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
