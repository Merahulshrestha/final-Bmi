
import 'package:flutter/material.dart';


class reusable_card extends StatelessWidget {
  final Color color;
  final VoidCallback ? onPressed; // If it is not initalized ? should be given
  final Widget ? cardChild;
const reusable_card({this.onPressed,  required this.color, this.cardChild }); // I missed ; at the end of constructor

  // I made a class in statefull widget when I should have done it at stateless widget

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: color),
            
      ),
    );
  }
}