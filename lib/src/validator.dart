import 'package:formini/formini.dart';
import 'package:schemani/schemani.dart';

class SchemaniForminiValidator implements Validator {
  final MapSchema schema;

  const SchemaniForminiValidator(this.schema);

  @override
  validate(values) {
    try {
      schema.validate(values);
    } on MapValidationException catch (exception) {
      return exception.exceptions;
    }

    return {};
  }
}
