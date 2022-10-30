import 'package:doctor_bmi/bottom_button.dart';
import 'package:doctor_bmi/input_page.dart';
import 'package:doctor_bmi/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key, required this.bmiResult, required this.resultText, required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Text("Result"),
            ),
          ),
          Expanded(
            flex: 5,
            child: reusable_card(
              color: activeCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(bmiResult),
                  Text(resultText),
                  Text(interpretation),
                ],
              ),
            ),
          ),
          Expanded(
            child: BottomButton(onPressed: (){
              Navigator.push(context,
              MaterialPageRoute(builder: ((context) => BmiCalculator())
              )
              );
            }, 
            text: "Re-Calculate")
          ),
        ],
      ),
    );
  }
}