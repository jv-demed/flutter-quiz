import 'package:app_quizz/data/questions.dart';
import 'package:app_quizz/question_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {

  ResultsScreen({ 
    super.key,
    required this.chosenAnswers, 
    required this.onRestartQuiz 
  });

  List<String> chosenAnswers;
  final Function() onRestartQuiz;

  List<Map<String, Object>> getSummaryData(){
    final List<Map<String, Object>> summary = [];
    for(var i = 0; i < chosenAnswers.length; i++){
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(context){

    final summary = getSummaryData();
    final totalQuestions = summary.length;
    final totalCorrectAnswers = summary.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Voce respondeu corretamente $totalCorrectAnswers de $totalQuestions perguntas',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 15
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionSummary(getSummaryData()),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: onRestartQuiz,
              label: const Text('Reiniciar Quiz'),
              style: TextButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white
              ),
              icon: const Icon(
                Icons.restart_alt
              ),
            )
          ],
        ), 
      ) 
    );
  }

}