class Answer {
  final String questionAnswer;
  final String correctAnswer;
  Answer({required this.questionAnswer, required this.correctAnswer});

  bool isCorrect() {
    return questionAnswer == correctAnswer;
  }
}

class Submission {
  final Map<Question, String> _answers = {};

  int getScore() {
    return _answers.entries
        .where((entry) => entry.key.goodAnswer == entry.value)
        .length;
  }
  String? getAnswerFor(Question question) {
    return _answers[question];
  }
  void addAnswer(Question question, String answer) {
    _answers[question] = answer;
  }
  void removeAnswers() {
    _answers.clear();
  }
}
class Question {
  final String title;
  final List<String> possibleAnswers;
  final String goodAnswer;

  Question({
    required this.title,
    required this.possibleAnswers,
    required this.goodAnswer,
  });
}
