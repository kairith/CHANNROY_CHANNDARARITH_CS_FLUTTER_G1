
import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onExpenseRemoved,
  });
  final List<Expense> expenses;
  final Function(Expense) onExpenseRemoved;
  // Calculate total expenses by category
  Map<Category, double> get categoryTotals {
    final totals = {
      Category.food: 0.0,
      Category.travel: 0.0,
      Category.leisure: 0.0,
      Category.work: 0.0,
    };

    for (final expense in expenses) {
      totals[expense.category] = totals[expense.category]! + expense.amount;
    }
    return totals;
  }

  @override
  Widget build(BuildContext context) {
    final totals = categoryTotals;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: totals.entries.map((entry) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '\$${entry.value.toStringAsFixed(2)}', // Display total amount
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Icon(
                        _getCategoryIcon(entry.key),
                        size: 30,
                       
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ),
       
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: expenses.isEmpty
                ? Center(
                  // EX3 
                    child: Text(
                      'No expenses added yet. Start by adding some!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[600],
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: expenses.length,
                    itemBuilder: (context, index) => Dismissible(
                      onDismissed: (direction) =>
                          onExpenseRemoved(expenses[index]),
                      key: Key(expenses[index].id),
                      child: ExpenseItem(expenses[index]),
                    ),
                  ),
          ),
        ),
      ],
    );
  }
  // Helper method to get category-specific icons
  IconData _getCategoryIcon(Category category) {
    switch (category) {
      case Category.food:
        return Icons.fastfood;
      case Category.travel:
        return Icons.flight;
      case Category.leisure:
        return Icons.movie;
      case Category.work:
        return Icons.work;
      default:
        return Icons.help;
    }
  }
}
