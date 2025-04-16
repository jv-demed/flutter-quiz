import 'package:flutter/material.dart';
import 'package:app_quizz/start_screen.dart';
import 'package:app_quizz/data/questions.dart';
import 'package:app_quizz/results_screen.dart';
import 'package:app_quizz/questions_screen.dart';

class Quiz extends StatefulWidget{

  const Quiz({ super.key });

  @override
  State<Quiz> createState(){
    return _QuizState();
  }

}

class _QuizState extends State<Quiz>{

  Widget? activeScreen;
  List<String> selectedAnswers = [];

  @override
  void initState(){
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void chooseAnswer(String answer){
    setState(() {
      selectedAnswers.add(answer);
    });
    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = ResultsScreen(
          chosenAnswers: selectedAnswers,
          onRestartQuiz: restartQuiz
        );
      });
    }
  }

  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      activeScreen = StartScreen(switchScreen);
    });
  }

  void switchScreen(){
    setState(() {
      activeScreen = QuestionsScreen(
        onSelectAnswer: chooseAnswer
      );
    });
  }

  @override
  Widget build(context){
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.indigoAccent,
                Colors.indigo
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            )
          ),
          child: activeScreen,
        )
      )
    );
  }

}