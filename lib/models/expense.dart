import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category {
  food,
  bills,
  clothes,
  entertainment,
  transport,
  other,
}

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final Category category;
  final DateTime date;
}
