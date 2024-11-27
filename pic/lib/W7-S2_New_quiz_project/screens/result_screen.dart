import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final String quizTitle;
  final VoidCallback onRestart;

  const ResultScreen({
    Key? key,
    required this.score,
    required this.totalQuestions,
    required this.quizTitle,
    required this.onRestart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              quizTitle,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Your score: $score on $totalQuestions',
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),


            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                onRestart(); // Reset the quiz score and state
                Navigator.popUntil(context, ModalRoute.withName('/')); 
                // Navigate back to the WelcomeScreen
              },
              child: const Text('Restart Quiz'),
              style: ElevatedButton.styleFrom(
                backgroundColor:  Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
