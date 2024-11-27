
import 'package:uuid/uuid.dart';

const Uuid uuid = Uuid();

enum ExpenseType { food,travel,leisure, work }

class Expense  {
  String id = const Uuid().v4();
  final String title;
  final double amount;
  final DateTime date;
  ExpenseType category;
  Expense({ required this.id, required this.title, required this.amount, required this.date, required this.category , });
}


