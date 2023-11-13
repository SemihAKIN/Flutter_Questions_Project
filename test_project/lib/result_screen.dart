import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_project/data/questions.dart';
import 'package:test_project/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {required this.onRestart, required this.chosenAnswers, super.key});

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly!',
              style: GoogleFonts.roboto(fontSize: 20, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              icon: const Icon(Icons.replay),
              label: const Text('Restart Quiz'),
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
              onPressed: onRestart,
            ),
          ],
        ),
      ),
    );
  }
}
