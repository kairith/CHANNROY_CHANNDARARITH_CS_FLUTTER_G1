import 'package:flutter/material.dart';
import 'package:pic/W7-S2_New_quiz_project/model/quiz.dart';
import 'package:pic/W7-S2_New_quiz_project/screens/result_screen.dart';

class QuestionScreen extends StatefulWidget {
  final Quiz quiz;

  const QuestionScreen({Key? key, required this.quiz}) : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int score = 0;
  int currentQuestionIndex = 0;

  // Function to calculate dynamic width based on title length
  double calculateTitleWidth(String title, BuildContext context) {
    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: title,
        style: const TextStyle(fontSize: 18), // Match the font size
      ),
      textDirection: TextDirection.ltr,
    )..layout();

    return textPainter.size.width + 40; // Add padding for a better layout
  }

  void _answerQuestion(String answer) {
    if (answer == widget.quiz.questions[currentQuestionIndex].goodAnswer) {
      setState(() {
        score++;
      });
    }

    if (currentQuestionIndex + 1 >= widget.quiz.questions.length) {
      // Show result screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            score: score,
            totalQuestions: widget.quiz.questions.length,
            quizTitle: widget.quiz.title,
            onRestart: _restartQuiz,
          ),
        ),
      );
    } else {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }

  void _restartQuiz() {
    setState(() {
      score = 0;
      currentQuestionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = widget.quiz.questions[currentQuestionIndex];
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.quiz.title),
      ),
      body: Center(
        // Wrap the body in a Center widget
        child: Column(
          mainAxisSize:
              MainAxisSize.min, // Minimize the column size to its children
          children: [
            Text(
              currentQuestion.title,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white, // Adjusted for better contrast
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ...currentQuestion.possibleAnswers.map((answer) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SizedBox(
                  width: calculateTitleWidth(
                      currentQuestion.title, context), // Dynamic width
                  height: 50, // Fixed height
                  child: ElevatedButton(
                    onPressed: () => _answerQuestion(answer),
                    child: Text(
                      answer,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Rounded edges
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
