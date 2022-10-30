import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
   BottomButton({required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: onPressed,
        child: Container(
          color: Colors.pink,
          child: Center(child: Text(text, style: 
          TextStyle(color: Colors.green),)),
           margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        
          
        ),
      ),
    );
  }
}