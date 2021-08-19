import 'package:dkatalistest/features/model/expense.dart';
import 'package:dkatalistest/features/model/goal_activation.dart';

import 'model/income.dart';

class Dummy {
  static List<GoalActivation> dummyGoalActivation() {
    return [
      GoalActivation("1", "Goal activation 1"),
      GoalActivation("2", "Goal activation 2"),
      GoalActivation("3", "Goal activation 3")
    ];
  }

  static List<Expense> dummyExpense() {
    return [
      Expense("1", 10000000),
      Expense("2", 15000000),
      Expense("3", 20000000)
    ];
  }

  static List<Income> dummyIncome() {
    return [
      Income("1", 10000000),
      Income("2", 15000000),
      Income("3", 20000000),
    ];
  }
}
