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

void main() {
  var scores = {'E': 0, 'I': 0, 'S': 0, 'N': 0, 'T': 0, 'F': 0, 'J': 0, 'P': 0};

  
  var questions = [
    Question(question: "질문1", answers: [
      Answer(text: "답변1", type: "E"),
      Answer(text: "답변2", type: "I")
    ]),
   
  ];

  void answerQuestion(String answerType) {
    scores[answerType] = scores[answerType]! + 1;
  }

  // When a user answers a question
  answerQuestion('E');

  

  var mbtiResult = '';
  mbtiResult += (scores['E']! > scores['I']!) ? 'E' : 'I';
  mbtiResult += (scores['S']! > scores['N']!) ? 'S' : 'N';
  mbtiResult += (scores['T']! > scores['F']!) ? 'T' : 'F';
  mbtiResult += (scores['J']! > scores['P']!) ? 'J' : 'P';

  print(mbtiResult); // Print the calculated MBTI result.
}
