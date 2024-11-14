void main() {
  // List of student scores
  List<int> scores = [45, 67, 82, 49, 51, 78, 92, 30];

  // You code

  List<int> passed = scores.where((score) => score >= 50).toList();
  
  print(' the score that passed are : $passed and the passed student are ${passed.length}');
 
}
