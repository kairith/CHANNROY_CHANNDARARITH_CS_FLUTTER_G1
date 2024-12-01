import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});

  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();

  // Use a map to associate display text with actual categories
  final Map<String, Category> _expenseCategories = {
    "Food": Category.food,
    "Travel": Category.travel,
    "Leisure": Category.leisure,
    "Work": Category.work,
  };
  DateTime? _selectedDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Default selected date
      firstDate: DateTime(2000), // Earliest selectable date
      lastDate: DateTime(2100), // Latest selectable date
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  String? _selectedCategoryKey; // Holds the key of the selected category

  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  void onCancel() {
    Navigator.pop(context);
  }

  void onAdd() {
    // Get input values
    String title = _titleController.text;
    double amount = double.tryParse(_valueController.text) ?? 0;

    // Validate inputs
    if (_selectedCategoryKey == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a category')),
      );
      return;
    }

    // Create the expense using the mapped category
    Expense expense = Expense(
      title: title,
      amount: amount,
      date: _selectedDate!,
      category: _expenseCategories[_selectedCategoryKey]!,
    );

    // Pass the expense to the parent
    widget.onCreated(expense);

    // Close the modal
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // TextField inside Row
              Expanded(
                // Expanded or Flexible widget helps in avoiding overflow
                child: TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: _valueController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    prefix: Text('\$ '),
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(width: 20),

              // Text to display date or 'No date selected'
              Text(
                _selectedDate == null
                    ? "No date selected"
                    : "${_selectedDate!.toLocal()}".split(' ')[0],
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(width: 10),

              // Icon for calendar
              GestureDetector(
                onTap: () => _selectDate(
                    context), // Calls the _selectDate function when tapped
                child: const Icon(
                  Icons.calendar_month_sharp, // Date icon
                  color: Colors.blue, // Icon color
                  size: 24.0, // Icon size
                ),
              ),
            ],
          ),
          const Row(
            children: [
              SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 20),
          const SizedBox(width: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200, // Limit dropdown size

                child: DropdownButton<String>(
                  value: _selectedCategoryKey,
                  hint: const Text('Select a category'),
                  items: _expenseCategories.keys
                      .map((key) => DropdownMenuItem<String>(
                            value: key,
                            child: Text(key),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCategoryKey = value;
                    });
                  },
                  isExpanded: true,
                ),
              ),
              ElevatedButton(onPressed: onCancel, child: const Text('Cancel')),
              const SizedBox(width: 20),
              ElevatedButton(
                  onPressed: onAdd, child: const Text('Save Expense')),
            ],
          ),
        ],
      ),
    );
  }
}
