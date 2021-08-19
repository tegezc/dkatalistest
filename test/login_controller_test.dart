import 'package:dkatalistest/features/controller/login_controller.dart';
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
}
