import 'package:doctor_bmi/bottom_button.dart';
import 'package:doctor_bmi/input_page.dart';
import 'package:doctor_bmi/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({ required this.bmiResult, required this.resultText, required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  
                  Text(resultText.toUpperCase(),
                  style: TextStyle(
                  color: Colors.pink,
                    fontSize: 22.0,
                   fontWeight: FontWeight.bold,
                    ) ),

                  Text(bmiResult,
                  style: TextStyle(
                   fontSize: 100.0,
                   
                   fontWeight: FontWeight.bold,
                      ) ), 

                  Text(interpretation,
                  textAlign: TextAlign.center,
                  style: TextStyle(
  fontSize: 22.0,
)),
                ],
              ),
            ),
          ),
          Expanded(
            child: BottomButton(onPressed: (){
              Navigator.pop(context);
            }, 
            text: "Re-Calculate")
          ),
        ],
      ),
    );
  }
}