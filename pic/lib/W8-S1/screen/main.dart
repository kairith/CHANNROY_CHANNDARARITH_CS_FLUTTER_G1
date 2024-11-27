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
           
            },
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 67, 163, 242),
        title: const Text('Expense Tracker'),
      ),
      body: Container(
        color: const Color.fromARGB(255, 67, 163, 242), 
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _registerExpenses.map((expense) {
              return Container(
                width: 300,
                height: 60, 
                decoration: BoxDecoration(
                  color: Colors.white, 
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.symmetric(vertical: 10), 
                padding: const EdgeInsets.all(8), 
                child: Center(
                  child: Text(
                    '${expense.title}: \$${expense.amount}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black, 
                    ),
                    textAlign: TextAlign.center, 
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
