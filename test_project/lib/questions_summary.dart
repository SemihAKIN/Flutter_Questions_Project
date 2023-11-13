import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  getColorIndex(summaryData) {}

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (data['user_answer'] == data['correct_answer'])
                          ? const Color.fromARGB(255, 115, 160, 197)
                          : const Color.fromARGB(255, 200, 112, 105),
                    ),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: GoogleFonts.roboto(
                              fontSize: 18, color: Colors.white),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          data['user_answer'] as String,
                          style: GoogleFonts.roboto(
                              fontSize: 13,
                              color: const Color.fromARGB(255, 207, 138, 138)),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          data['correct_answer'] as String,
                          style: GoogleFonts.roboto(
                              fontSize: 13,
                              color: const Color.fromARGB(255, 77, 117, 149)),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
