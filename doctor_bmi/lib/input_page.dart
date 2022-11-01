import 'package:circle_button/circle_button.dart';
import 'package:doctor_bmi/bottom_button.dart';
import 'package:doctor_bmi/calculator_brain.dart';
import 'package:doctor_bmi/result_page.dart';
import 'package:doctor_bmi/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:doctor_bmi/icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

enum Gender { male, female }

Gender? selectedGender; // Put ? at varaible
Color activeCardColour = Colors.amber;
Color inActiveCardColour = Colors.deepPurpleAccent;
const heightStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
);
 int height = 180;
 int age = 20;
 int weight = 60;

class _BmiCalculatorState extends State<BmiCalculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Column(
       
        children: [
          
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  
                  child: reusable_card(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? activeCardColour
                        : inActiveCardColour,
                        cardChild: IconContent(icon: FontAwesomeIcons.mars,
                    label: 'MALE',),
                  ),
                ),
                Expanded(
                  
                  child: reusable_card(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                        // I got confused on assignment operator
                        // I did == instead of =
                      });
                    },
                    color: selectedGender == Gender.female
                        ? activeCardColour
                        : inActiveCardColour,
                        cardChild: IconContent(icon: FontAwesomeIcons.venus,
                    label: 'FEMALE',),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: reusable_card(
              color: activeCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Height", style:
                  TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900,
                    ),),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        height.toString(),
                      ),
                      const Text("cm",
                      style:TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
))
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: reusable_card(
                    color: activeCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                          Text(
                          'AGE',
                           style:TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
),
                        ),
                        Text(
                          age.toString(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleButton(
                              onTap: () => {
                                setState(() {
                                  age++;
                                })
                              },
                              width: 50.0,
                              height: 50.0,
                              borderColor: Colors.deepPurpleAccent,
                              borderWidth: 4.0,
                              borderStyle: BorderStyle.solid,
                              backgroundColor: Colors.transparent,
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            CircleButton(
                                onTap: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                borderWidth: 4.0,
                                width: 50.0,
                                height: 50.0,
                                borderColor: Colors.deepPurpleAccent,
                                child: const Icon(Icons.exposure_minus_1,
                                    color: Colors.white))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
            
            child: reusable_card(
              color: activeCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                          'Weight',
                          style: TextStyle(
                              fontSize: 18.0,
  color: Color(0xFF8D8E98),
                          ),
                        ),
                  Text(
                    weight.toString(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       
                      CircleButton(
                        onTap: () {
                          setState(() {
                            weight++;
                          });
                        },
                        borderWidth: 4,
                        width: 50,
                        height: 50,
                        child: const Icon(Icons.add,
                         color: Colors.white),
                      ),
                      const SizedBox(width: 10,),
                      CircleButton(
                        onTap: (){
                          setState(() {
                            weight--;
                          });
                        },
                        borderWidth: 4,
                        width: 50,
                        height: 50,
                        child: const Icon(Icons.exposure_minus_1, 
                        color: Colors.white,),
                        ),
                    ],
                  ),
                ],
              ),
             ),
           ),
              ],
            ),
          ),
          
          Expanded(
            child: BottomButton(onPressed: ( ){ 
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
              context, MaterialPageRoute(builder: 
              (context) => 
               ResultPage(bmiResult: calc.calculateBMI(), 
               interpretation: calc.getInterpretation(),
                resultText: calc.getResult(),

              ))
            );
            }, text: "Calculate"),
          ),
        ], 
      ),
      
    );
  }
}
