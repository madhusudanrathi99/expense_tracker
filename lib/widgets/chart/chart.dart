import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/chart/chart_bar.dart';

class Chart extends StatelessWidget {
  const Chart(this.expenseList, {super.key});

  final List<Expense> expenseList;
  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expenseList, Category.food),
      ExpenseBucket.forCategory(expenseList, Category.bills),
      ExpenseBucket.forCategory(expenseList, Category.clothes),
      ExpenseBucket.forCategory(expenseList, Category.entertainment),
      ExpenseBucket.forCategory(expenseList, Category.transport),
      ExpenseBucket.forCategory(expenseList, Category.other),
    ];
  }

  double get maxTotalExpense {
    double maxAmount = 0;
    for (final bucket in buckets) {
      if (bucket.totalAmount > maxAmount) {
        maxAmount = bucket.totalAmount;
      }
    }
    return maxAmount;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 16,
      ),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in buckets)
                  ChartBar(
                    bucket.totalAmount / maxTotalExpense,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: buckets
                .map(
                  (bucket) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                      ),
                      child: Icon(
                        categoryIcons[bucket.category],
                        color: isDarkMode
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.7),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
