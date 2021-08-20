import 'package:dkatalistest/features/external/ComponentStrengthPassword.dart';
import 'package:dkatalistest/features/model/PasswordValidation.dart';
import 'package:dkatalistest/features/model/enum/password_strength.dart';

class LoginController {
  static const minlengthPassword = 8;

  bool checkEmail(String email) {
    String em = email;
    RegExp exp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    return exp.hasMatch(em);
  }

  PasswordValidation checkPassword(String pass) {
    String password = pass;
    // if (password.length < 8) {
    //   return PasswordValidation.empty();
    // }

    bool hasUppercase = password.contains(new RegExp(r'[A-Z]'));
    bool hasDigits = password.contains(new RegExp(r'[0-9]'));
    bool hasLowercase = password.contains(new RegExp(r'[a-z]'));
    bool hasSpecialCharacters =
        password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasMinLength = password.length >= minlengthPassword;

    return PasswordValidation.fill(
        hasLowercase: hasLowercase,
        hasUpercase: hasUppercase,
        hasChar: hasSpecialCharacters,
        hasNumber: hasDigits,
        validLength: hasMinLength,
        strengthPassword: _checkPassStrenght(password));
    //  return hasDigits & hasUppercase & hasLowercase & hasSpecialCharacters & hasMinLength;
  }

  EPasswordStrength _checkPassStrenght(String password) {
    String pwd = password;
    if (pwd.isEmpty) {
      return EPasswordStrength.kosong;
    }
    // Estimate the password's strength.
    double strength = ComponentPasswordStrength.estimateBruteforceStrength(pwd);
    EPasswordStrength passwordStrength;

    if (strength < 0.3) {
      passwordStrength = EPasswordStrength.weak;
    } else if (strength < 0.7) {
      passwordStrength = EPasswordStrength.fairstrong;
    } else {
      passwordStrength = EPasswordStrength.strong;
    }
    return passwordStrength;
  }
}
