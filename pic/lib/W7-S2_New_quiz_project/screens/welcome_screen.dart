import 'package:flutter/material.dart';
import 'package:pic/W7-S2_New_quiz_project/widgets/app_button.dart'; // Assuming you have AppButton

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onStart;
  final String quizTitle;

  const WelcomeScreen({
    Key? key,
    required this.onStart,
    required this.quizTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/quiz-logo.png',
              width: 500,
              height: 500,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            Text(
              quizTitle,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            AppButton(
              // AppButton for the Start Quiz button
              text: 'Start Quiz',
              onPressed: onStart, // Calls onStart to start the quiz
              color: Colors.white,
              textColor: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
