# File Generator

A Flutter package for generating files and Bloc structures in your Flutter projects. This package simplifies the process of creating essential files for managing features in your application, adhering to the Bloc pattern.

## Features

- Easily generates files with specified content.
- Creates a Bloc file structure for your features, including Bloc, Event, and State files.
- Supports debugging output for file creation.

## Installation

To use this package, add `file_generator` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  file_generator:
    git:
      url: https://github.com/albaraa-prog/file_generator
```

````

Then, run the following command to install the package:

```bash
flutter pub get
```

## Usage

### Import the Package

```dart
import 'package:file_generator/file_generator.dart';
```

### Generating a File

You can generate a file with specified content by using the `generateFile` method:

```dart
final fileGenerator = FileGenerator();

await fileGenerator.generateFile(
  path: 'lib/', // Specify the directory path
  fileName: 'example.txt',
  content: 'This is an example file.',
);
```

### Generating Bloc Structure

To create a Bloc file structure for a specific feature, use the `generateBlocStructure` method:

```dart
await fileGenerator.generateBlocStructure('auth', 'lib/');
// This will create the following files:
// lib/auth/auth_bloc.dart
// lib/auth/auth_event.dart
// lib/auth/auth_state.dart
```

### Debugging Output

While debugging, the package will print the paths of created files in the console. This feature is enabled when the app is running in debug mode.

## Example

Here's an example of how to use the `FileGenerator` class:

```dart
import 'dart:io';
import 'package:file_generator/file_generator.dart';

void main() async {
  final fileGenerator = FileGenerator();

  // Generate a simple file
  await fileGenerator.generateFile(
    path: 'lib/',
    fileName: 'example.txt',
    content: 'Hello, Flutter!',
  );

  // Generate Bloc structure for a feature
  await fileGenerator.generateBlocStructure('auth', 'lib/');
}
```

## Contribution

Contributions are welcome! If you would like to contribute to the project, please fork the repository and submit a pull request.

## License

This package is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For any questions or suggestions, feel free to reach out at [albraa9021@gmail.com].

---

Happy coding!

````
