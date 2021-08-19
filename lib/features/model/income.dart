class Income {
  String code;
  int income;

  Income(this.code, this.income);
  bool operator ==(dynamic other) =>
      other != null && other is Income && this.code == other.code;

  @override
  int get hashCode => super.hashCode;
}
