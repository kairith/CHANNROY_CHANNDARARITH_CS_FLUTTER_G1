import 'package:flutter/material.dart';
import 'package:pic/W8-S1/model/expense.dart';

class MyView extends StatefulWidget {
  MyView({super.key});

  @override
  State<MyView> createState() => _MyViewState();
}

class _MyViewState extends State<MyView> {
  void onPressed() {
    setState(() {});
  }

  // Fixed initialization of _registerExpenses
  final List<Expense> _registerExpenses = [
    Expense(
      id: '1',
      title: 'Ronan the best ',
      amount: 1000,
      date: DateTime.now(),
      category: ExpenseType.work,
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
      body: Container(
        color: const Color.fromARGB(255, 67, 163, 242), // Set ARGB background color
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _registerExpenses.map((expense) {
              return Container(
                width: 300, // Set the width of the container
                height: 60, // Set the height of the container
                decoration: BoxDecoration(
                  color: Colors.white, // Set background color for each expense
                  borderRadius: BorderRadius.circular(10), // Set border radius
                ),
                margin: const EdgeInsets.symmetric(vertical: 10), // Add margin between items
                padding: const EdgeInsets.all(8), // Padding inside the container
                child: Center(
                  child: Text(
                    '${expense.title}: \$${expense.amount}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black, // Set text color to black for contrast
                    ),
                    textAlign: TextAlign.center, // Center the text
                  ),
                ),
              );
            }).toList(),
          ),
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
