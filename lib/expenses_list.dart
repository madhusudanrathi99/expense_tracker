import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(this.expensesList, {super.key});

  final List<Expense> expensesList;

  Widget itemBuilder(ctx, index) {
    return Text(expensesList[index].title);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: itemBuilder,
      itemCount: expensesList.length,
    );
  }
}
