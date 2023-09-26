import 'package:flutter/material.dart';

class QuizCard extends StatelessWidget {
  const QuizCard(
      {super.key,
      required this.quiz,
      required this.onCorrect,
      required this.onIncorrect});

  final Map<String, dynamic> quiz;
  final Function onCorrect;
  final Function onIncorrect;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 64),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            quiz["question"],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 24),
          ListView.builder(
            itemCount: quiz["options"].length,
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              return ElevatedButton(
                onPressed: () {
                  quiz['answer'] == index + 1 ? onCorrect() : onIncorrect();
                },
                child: Text(quiz["options"][index]),
              );
            }),
          )
        ],
      ),
    );
  }
}
