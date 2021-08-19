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
}
