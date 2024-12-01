import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
            onChanged: (value) {
              setState(() {});
            },
          ),
          TextField(
            controller: _amountController,
            maxLength: 10, 
            keyboardType: TextInputType.number, 
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly, // Allows only digits
            ],
            decoration: const InputDecoration(
              label: Text('Amount'),
              prefix: Text("\$"),
            ),
            onChanged: (value) {
              setState(() {});
            },
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('check value'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('cancel'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('create'),
          ),
        ],
      ),
    );
  }
}
