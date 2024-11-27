// import 'model/quiz.dart';
// import 'model/submission.dart';

// void main() {
//   const question1 = Question(
//     title: 'What is 2 + 2?',
//     possibleAnswers: ['3', '4', '5'],
//     goodAnswer: '4',
//   );

//   const question2 = Question(
//     title: 'What is the capital of France?',
//     possibleAnswers: ['Berlin', 'Madrid', 'Paris'],
//     goodAnswer: 'Paris',
//   );

//   final submission = Submission(answers: []);
//   submission.addAnswer(question1, '4');
//   submission.addAnswer(question2, 'Paris');
//   print("Total score is: ${submission.getScore()}");


//   final answer = submission.getAnswerFor(question1);
//   final answer2 = submission.getAnswerFor(question2);
//   print("The answer for Q1 is: ${answer?.answer}");
//   print("The answer for Q2 is: ${answer2?.answer}");

// }