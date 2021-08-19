import 'package:dkatalistest/features/controller/login_controller.dart';
import 'package:dkatalistest/features/model/PasswordValidation.dart';
import 'package:dkatalistest/features/model/enum/password_strength.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final LoginController loginController = LoginController();
  final List<String> validAddresses = [
    'fredrik@dualog.com',
    'customer/department=shipping@example.com',
    '\$A12345@example.com',
    '!def!xyz%abc@example.com',
    '_somename@example.com',

    // examples from wikipedia
    'niceandsimple@example.com',
    'very.common@example.com',
    'a.little.lengthy.but.fine@dept.example.com',
    'disposable.style.email.with+symbol@example.com',

    'a@single-character-in-local.org',
    'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@letters-in-local.org',
    'backticksarelegit@test.com',
    'country-code-tld@sld.rw',
    'country-code-tld@sld.uk',
    'letters-in-sld@123.com',
    'local@dash-in-sld.com',
    'local@sld.newTLD',
    'local@sub.domains.com',
    'mixed-1234-in-{+^}-local@sld.net',
    'one-character-third-level@a.example.com',
    'one-letter-sld@x.org',
    'punycode-numbers-in-tld@sld.xn--3e0b707e',
    'single-character-in-sld@x.org',
    'the-character-limit@for-each-part.of-the-domain.is-sixty-three-characters.this-is-exactly-sixty-three-characters-so-it-is-valid-blah-blah.com',
    'the-total-length@of-an-entire-address.cannot-be-longer-than-two-hundred-and-fifty-four-characters.and-this-address-is-254-characters-exactly.so-it-should-be-valid.and-im-going-to-add-some-more-words-here.to-increase-the-length-blah-blah-blah-blah-bla.org',
    'uncommon-tld@sld.mobi',
    'uncommon-tld@sld.museum',
    'uncommon-tld@sld.travel'
  ];

  final List<String> invalidAddresses = [
    //'invalid',
    // 'invalid@',
    'invalid @',
    'invalid@[555.666.777.888]',
    'invalid@[IPv6:123456]',
    'invalid@[127.0.0.1.]',
    'invalid@[127.0.0.1].',
    'invalid@[127.0.0.1]x',

    // examples from wikipedia
    'Abc.example.com',
    'A@b@c@example.com',
    'a\"b(c)d,e:f;g<h>i[j\\k]l@example.com',
    'just\"not\"right@example.com',
    'this is\"not\\allowed@example.com',
    'this\\ still\\\"not\\\\allowed@example.com',

    // examples from https://github.com/Sembiance/email-validator
    '! #\$%`|@invalid-characters-in-local.org',
    '(),:;`|@more-invalid-characters-in-local.org',
    '* .local-starts-with-dot@sld.com',
    '<>@[]`|@even-more-invalid-characters-in-local.org',
    '@missing-local.org',
    'IP-and-port@127.0.0.1:25',
    'invalid',
    'invalid-characters-in-sld@! \"#\$%(),/;<>_[]`|.org',
    'missing-at-sign.net',
    'missing-sld@.com',
    'missing-tld@sld.',
    'sld-ends-with-dash@sld-.com',
    'sld-starts-with-dashsh@-sld.com',
  ];

  /// dummy weak password
  /// ref : https://www.secureworld.io/industry-news/worst-passwords-of-2020-list
  final List<String> weakPasswords = [
    "1234567890",
    "password",
    "123456789",
    "password",
    "12345678",
    "11111111",
    "12341234",
    "1234567890",
    "qwertyui",
    "iloveyou",
  ];

  final List<String> fairStrongs = [
    "qwertyu1",
    "password1",
    "Medium12",
    "picture1",
    "Password1",
    "qwErtyui1",
    "abcd1234",
    "Iloveyou1",
    "abcDefg1"
  ];

  final List<String> strongPasswords = [
    "q3~PDBK[fh5\"Q;#8",
    "m2#\";<R?x@g/urvd",
    "kW^_7V`TueG),%~C",
    "J#;AsP/'9X](CzFZ",
    "UEH@Gp*,m^r25f+4",
    "J=3_9CY;>frMtdTv",
    "zhP4)}<NLB?2>;j5",
    "sT;2u3<Vy^At*\"6P",
    "Cn-8p)A?u~%R}MT{"
  ];

  final String passLess8digit = "#xabmni";
  group("Test validasi Email", () {
    test('Validasi email tidak valid', () {
      for (var actual in invalidAddresses) {
        expect(loginController.checkEmail(actual), equals(false),
            reason: 'E-mail: ' + actual.toString());
      }
    });

    test('validasi Email valid', () {
      for (var actual in validAddresses) {
        expect(loginController.checkEmail(actual), equals(true),
            reason: 'E-mail: ' + actual);
      }
    });
  });

  group("Test Password", () {
    test("Test Weak password", () {
      for (var weakPassword in weakPasswords) {
        PasswordValidation passwordValidation =
            loginController.checkPassword(weakPassword);
        expect(
            passwordValidation.strengthPassword, equals(EPasswordStrength.weak),
            reason: 'Password: ' + weakPassword);
      }
    });

    test("Test Fair Strong Password", () {
      for (var fairstrong in fairStrongs) {
        PasswordValidation passwordValidation =
            loginController.checkPassword(fairstrong);
        expect(passwordValidation.strengthPassword,
            equals(EPasswordStrength.fairstrong),
            reason: 'Password: ' + fairstrong);
      }
    });

    test("Test Strong Password", () {
      for (var strongpassword in strongPasswords) {
        PasswordValidation passwordValidation =
            loginController.checkPassword(strongpassword);
        expect(passwordValidation.strengthPassword,
            equals(EPasswordStrength.strong),
            reason: 'Password: ' + strongpassword);
      }
    });

    test("password is less than 8 digits", () {
      PasswordValidation passwordValidation =
          loginController.checkPassword(passLess8digit);
      expect(
          passwordValidation.strengthPassword, equals(EPasswordStrength.kosong),
          reason: 'Password: ' + passLess8digit);
    });
  });
}
