import 'package:flutter/material.dart';
import 'model/quiz.dart';

Color appColor = Colors.blue[500]!;
void onPressed() {
}
class QuizApp extends StatefulWidget {
  const QuizApp(this.quiz, {super.key});

  final Quiz quiz;

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: appColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(
                  'assets/image/quiz-logo.png', // Ensure this path is correct
                  width: 400,
                  height: 400,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                child: const Text("Crazy Quiz",
                style: TextStyle(color: Colors.white,fontSize: 40),),
              ),
              const SizedBox(height: 20,),
              Container(
                child: TextButton(
                  onPressed: onPressed,  // Calls the onPressed function
                  child: const Text(
                    "Start Quiz",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 35, 98, 150), // Proper way to set button background color
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
