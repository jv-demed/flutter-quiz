import 'package:flutter/material.dart';

class QuestionButton extends StatelessWidget{

  const QuestionButton({
    super.key,
    required this.answerText,
    required this.onTap
  });

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(context){
    return ElevatedButton(
      onPressed: onTap, 
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 40
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40)
        )
      ),
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      )
    );
  }

}