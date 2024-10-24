import 'package:file_generator/file_generator.dart';

void main() async {
  final generator = FileGenerator();

  // Example usage: generate a Dart model file
  const modelContent = '''
  class User {
    final String name;
    final int age;

    User({required this.name, required this.age});
  }
  ''';

  await generator.generateFile(
    path: 'lib/models', // Specify the directory
    fileName: 'user.dart', // Specify the file name
    content: modelContent, // Provide the file content
  );
}
