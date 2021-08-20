class ItemUiEmailView {
  String email;
  bool isvalid;

  ItemUiEmailView(this.email, this.isvalid);

  bool operator ==(dynamic other) =>
      other != null &&
      other is ItemUiEmailView &&
      this.isvalid == other.isvalid;

  @override
  int get hashCode => super.hashCode;
}
