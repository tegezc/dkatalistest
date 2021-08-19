class GoalActivation {
  String code;
  String text;

  GoalActivation(this.code, this.text);
  bool operator ==(dynamic other) =>
      other != null && other is GoalActivation && this.code == other.code;

  @override
  int get hashCode => super.hashCode;
}
