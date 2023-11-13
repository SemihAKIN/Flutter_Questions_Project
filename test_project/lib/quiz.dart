import 'package:flutter/material.dart';
import 'package:test_project/data/questions.dart';
import 'package:test_project/questions_screen.dart';
import 'package:test_project/result_screen.dart';
import 'package:test_project/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> _selectedAnswers = [];
  var activeScreen = 'start-screen';
/*   @override
  void initState() {
    activescreen = StartScreen(switchScreen);
    super.initState();
  } */

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      _selectedAnswers = [];
      activeScreen = 'question_screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    if (activeScreen == 'result-screen') {
      setState(() {
        screenWidget = ResultScreen(
          chosenAnswers: _selectedAnswers,
          onRestart: restartQuiz,
        );
      });
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 51, 2, 135),
                Color.fromARGB(255, 131, 72, 233)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,

          /* activeScreen == 'start-screen'
              ? StartScreen(switchScreen)
              : const QuestionScreen() */
        ),
      ),
    );
  }
}
