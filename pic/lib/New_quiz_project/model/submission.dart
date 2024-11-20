import 'package:pic/New_quiz_project/model/quiz.dart';

class Answer {
  String answer;
  Question question; 

  Answer({
    required this.answer,
    required this.question,
  });

  bool isCorrect() {
    return question.goodAnswer.contains(answer);
  }
}

class Submission {
  
  List<Answer> answers;

  Submission({required this.answers});

  void addAnswer(Question question, String answer) {
    answers.add(Answer(answer: answer, question: question));
    
  }

  int getScore() {
    int totalScore = 0;
    for (var answer in answers) {
      if (answer.isCorrect()) {
        totalScore += 1; 
      }else{
        totalScore == 0;  // Penalize incorrect answers by half the score
      }
    }
    return totalScore;
  }

  void removeAnswer(Answer answer) {
    answers.remove(answer);
   
  }

  Answer? getAnswerFor(Question question) {
    try {
      return answers.firstWhere((answer) => answer.question == question);
    } catch (e) {
      return null; 
    }
  }
}