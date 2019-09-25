import 'package:flutter_test/flutter_test.dart';
import 'package:schemani/schemani.dart';

import 'package:schemani_formini/schemani_formini.dart';

void main() {
  test('it returns the exceptions', () {
    const schema = MapSchema({
      'email': [Required(), Email()],
    });
    const validator = SchemaniForminiValidator(schema);

    final errors = validator.validate({ 'email': 'foo' });

    expect(errors['email'] is Exception, true);
  });
}
