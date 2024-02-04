import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _userExpenses = [
    Expense(
      title: "New Shoes",
      amount: 69.99,
      category: Category.clothes,
      date: DateTime.now(),
    ),
    Expense(
      title: "Groceries",
      amount: 16.53,
      category: Category.food,
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
      ),
      body: Column(
        children: [
          const Text('Chart'),
          Expanded(
            child: ExpensesList(_userExpenses),
          ),
        ],
      ),
    );
  }
}
