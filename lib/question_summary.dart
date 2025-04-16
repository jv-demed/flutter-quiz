import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {

  const QuestionSummary(this.summaryData, { super.key });

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context){
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data){
            return Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: 30, // tamanho fixo pro círculo
                      height: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.indigo, // cor de fundo
                        shape: BoxShape.circle, // deixa redondo
                      ),
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: TextStyle(
                          color: Colors.white
                        ),
                      )
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            data['question'] as String,
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 15
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Resposta correta: ${data['correct_answer'] as String}',
                            style: GoogleFonts.lato(
                              color: Colors.white
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Sua resposta: ${data['user_answer'] as String}',
                            style: GoogleFonts.lato(
                              color: data['user_answer'] == data['correct_answer']
                                ? const Color.fromARGB(255, 178, 240, 180)
                                : const Color.fromARGB(255, 255, 144, 144)
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                )
              ],
            );
          }).toList()
        ),
      ),
    );
  }

}