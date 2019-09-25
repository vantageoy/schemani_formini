# schemani_formini

A bridge validator class for validating [formini](https://pub.dev/packages/formini) values using schemas built with [schemani](https://pub.dev/packages/schemani).

Please note that the schemani/formini packages are under development. There are still some issues to resolve before this has any help for real use cases.

## Installation

[schemani](https://pub.dev/packages/schemani) and [formini](https://pub.dev/packages/formini) packages are required to be installed along with this package.

## Usage

```dart
import 'package:formini/formini.dart';
import 'package:schemani/schemani.dart';
import 'package:schemani_formini/schemani_formini.dart';

class LoginForm extends StatelessWidget {
  /// The schema for validating the form values.
  static const schema = MapSchema({
    'email': [Required(), Email()],
    'password': [Required()],
  });
  
  @override
  Widget build(BuildContext context) {
    return Formini(
      validator: const ForminiSchemaniValidator(schema),
      initialValues: const {'email': 'foo'},
      onSubmit: _authenticate,
      child: Column(children: [
        // ...
      ]),
    );
  }
}
```

### Customization

The `ForminiSchemaniValidator` class is very simple. Just go and grab it into your project if you need something special.

## API reference

https://pub.dev/documentation/schemani_formini

## Contributing

Please open an issue or pull request in GitHub. Any help and feedback is much appreciated.

## Licence

MIT
