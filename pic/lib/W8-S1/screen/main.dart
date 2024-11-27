import 'package:flutter/material.dart';
import 'package:pic/W8-S1/model/expense.dart';





class MyView extends StatefulWidget {
 MyView({super.key});
  
  @override
  State<MyView> createState() => _MyViewState();
  
}

class _MyViewState extends State<MyView> {
  void onPressed(){
 setState(() {
    
 });
 }
  // Fixed initialization of _registerExpenses
  final List<Expense> _registerExpenses = [
    Expense(
      id: '1',
      title: 'Rent',
      amount: 1000,
      date: DateTime.now(),
      category: ExpenseType.work,
    ),
        Expense(
      id: '2',
      title: 'personal',
      amount: 1000,
      date: DateTime.now(),
      category: ExpenseType.food,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Navigate to AddExpenseScreen
              // Add navigation logic here
            },
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 67, 163, 242),
        title: const Text('Expense Tracker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _registerExpenses.map((expense) {
            return Text(
              '${expense.title}: \$${expense.amount}',
              style: const TextStyle(fontSize: 16)
              ,
            );
          }).toList(),
        ),
      ),
    );
  }
}

void main() {
  
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyView(),
  ));
}
