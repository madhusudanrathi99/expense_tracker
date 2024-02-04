import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category {
  food,
  bills,
  clothes,
  entertainment,
  transport,
  other,
}

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.bills: Icons.receipt,
  Category.clothes: Icons.shopping_bag,
  Category.entertainment: Icons.movie,
  Category.transport: Icons.travel_explore,
  Category.other: Icons.category,
};

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

  String get formattedDate {
    return formatter.format(date);
  }
}
