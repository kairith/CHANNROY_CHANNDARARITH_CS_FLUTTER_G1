import 'package:flutter/material.dart';
import 'package:pic/W7-S2_New_quiz_project/screens/welcome_screen.dart';
import 'package:pic/W7-S2_New_quiz_project/screens/question_screen.dart';
import 'package:pic/W7-S2_New_quiz_project/screens/result_screen.dart';
import 'package:pic/W7-S2_New_quiz_project/model/quiz.dart';

void main() {
  Question q1 = const Question(
    title: "Who is the best teacher?",
    possibleAnswers: ["ronan", "hongly", 'leangsiv'],
    goodAnswer: 'ronan',
  );
  Question q2 = const Question(
    title: "Which color is the best?",
    possibleAnswers: ["blue", "red", 'green'],
    goodAnswer: 'red',
  );
  Question q3 = const Question(
    title: "Who is the vichet?",
    possibleAnswers: ["DJ", "Gamer", 'software developer'],
    goodAnswer: 'software developer',
  );

  List<Question> myQuestions = [q1, q2, q3];
  Quiz myQuiz = Quiz(title: "Crazy Quizz", questions: myQuestions);

  runApp(QuizApp(myQuiz));
}

class QuizApp extends StatefulWidget {
  final Quiz quiz;

  const QuizApp(this.quiz, {Key? key}) : super(key: key);

  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int score = 0;
  int currentQuestionIndex = 0;

  void _restartQuiz() {
    setState(() {
      score = 0;
      currentQuestionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(
              quizTitle: widget.quiz.title,
              onStart: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuestionScreen(quiz: widget.quiz),
                  ),
                );
              },
            ),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/question') {
          return MaterialPageRoute(
            builder: (context) => QuestionScreen(quiz: widget.quiz),
          );
        }
        if (settings.name == '/result') {
          return MaterialPageRoute(
            builder: (context) => ResultScreen(
              score: score,
              totalQuestions: widget.quiz.questions.length,
              quizTitle: widget.quiz.title,
              onRestart: _restartQuiz,
            ),
          );
        }
        return null;
      },
    );
  }
}
