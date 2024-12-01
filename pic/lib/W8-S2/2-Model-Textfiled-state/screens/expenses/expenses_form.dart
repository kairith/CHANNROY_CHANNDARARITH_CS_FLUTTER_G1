import 'package:flutter/material.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {

  String value = '';

  void onTextPressed(String newValue) {
    setState(() {
      value = newValue;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextField(
            onChanged: onTextPressed,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),

          TextField(
            onChanged: onTextPressed,
            maxLength: 10,
            decoration: const InputDecoration(
              label: Text('Amount'),
            ),
          ),
          Text("Value is $value"),
        ],
      ),
    );
  }
}
