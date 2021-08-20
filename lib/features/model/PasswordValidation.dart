import 'enum/password_strength.dart';

class PasswordValidation {
  bool hasLowercase = false;
  bool hasUpercase = false;
  bool hasNumber = false;
  bool hasChar = false;
  bool validLength = false;
  EPasswordStrength strengthPassword = EPasswordStrength.kosong;

  PasswordValidation.empty();

  PasswordValidation.fill(
      {required this.hasLowercase,
      required this.hasUpercase,
      required this.hasNumber,
      required this.hasChar,
      required this.validLength,
      required this.strengthPassword});

  bool ispasswordValid() {
    return this.hasLowercase &&
        this.hasUpercase &&
        this.hasChar &&
        this.hasNumber &&
        this.validLength;
  }

  bool operator ==(dynamic other) =>
      other != null &&
      other is PasswordValidation &&
      this.hasUpercase == other.hasUpercase &&
      this.hasLowercase == other.hasLowercase &&
      this.hasNumber == other.hasNumber &&
      this.hasChar == other.hasChar &&
      this.strengthPassword == other.strengthPassword;

  @override
  int get hashCode => super.hashCode;
}
