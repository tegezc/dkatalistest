class Expense {
  String code;
  int expense;

  Expense(this.code, this.expense);
  bool operator ==(dynamic other) =>
      other != null && other is Expense && this.code == other.code;

  @override
  int get hashCode => super.hashCode;
}
