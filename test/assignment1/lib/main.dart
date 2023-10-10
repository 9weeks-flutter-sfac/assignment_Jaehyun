// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Question {
  final String question;
  final List<Answer> answers;

  Question({required this.question, required this.answers});
}

class Answer {
  final String text;
  final String type;

  Answer({required this.text, required this.type});
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MBTI 테스트',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  Map<String, int> scores = {
    'E': 0,
    'I': 0,
    'S': 0,
    'N': 0,
    'T': 0,
    'F': 0,
    'J': 0,
    'P': 0
  };

  // 결과 변수
  var result = '';

// 질문 목록 
  List<Question> questions = [
    Question(question: "파티에 가셨나요?", answers: [
      Answer(text: "낯선 사람을 포함한 많은 사람들과 소통", type: "E"),
      Answer(text: "이미 알고 있는 소수의 사람들과 소통하기", type: "I"),
    ])
  ]; 


  void answerQuestion(String answerType) {
    setState(() {
      scores[answerType] = scores[answerType]! + 1;
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 퀴즈 종료 
    if (currentQuestionIndex >= questions.length) {
      result += (scores['E']! > scores['I']!) ? 'E' : 'I';
      result += (scores['S']! > scores['N']!) ? 'S' : 'N';
      result += (scores['T']! > scores['F']!) ? 'T' : 'F';
      result += (scores['J']! > scores['P']!) ? 'J' : 'P';
      return Scaffold(
        appBar: AppBar(title: Text('Result')),
        body: Center(
            child: Text(result)),
      );
    }
    
    var currentQuestion = questions[currentQuestionIndex];

    // 퀴즈 진행중
    return Scaffold(
      appBar: AppBar(
        title: Text('MBTI 테스트'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child:
                Text(currentQuestion.question, style: TextStyle(fontSize: 16)),
          ),
          ...currentQuestion.answers.map((answer) => ElevatedButton(
                onPressed: () => answerQuestion(answer.type),
                child: Text(answer.text),
              ))
        ],
      ),
    );
  }
}
