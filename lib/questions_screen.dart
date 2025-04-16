import 'package:flutter/material.dart';
import 'package:app_quizz/data/questions.dart';
import 'package:app_quizz/question_button.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget{

  const QuestionsScreen({ super.key, required this.onSelectAnswer });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState(){
    return _QuestionsScreenState();
  }

}

class _QuestionsScreenState extends State<QuestionsScreen>{

  var currentQuestionIndex = 0;

  void answerQuestion(String answer){
    widget.onSelectAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context){

    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((answer){
              return QuestionButton(
                answerText: answer, 
                onTap: (){
                  answerQuestion(answer);
                }
              );
            })
          ],
        ), 
      ) 
    );
  }

}