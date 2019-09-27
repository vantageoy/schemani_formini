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
      return _transform(exception);
    }

    return null;
  }

  /// Transform the given [ValidationException] exception into a [ForminiException].
  ///
  /// @todo It should keep the original exception and not make a new one. How do?
  ForminiException _transform(ValidationException exception) {
    if (exception is MapValidationException) {
      return ForminiException.map(exception.exceptions.map(
        (field, exception) => MapEntry(field, _transform(exception)),
      ));
    }

    return ForminiException(message: exception.toString());
  }
}
