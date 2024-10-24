import 'package:file_generator/file_generator.dart';

void main() async {
  final fileGenerator = FileGenerator();
  await fileGenerator.generateFile(
    path: 'lib/',
    fileName: 'example_file.txt',
    content: 'This is an example file.',
  );
  await fileGenerator.generateBlocStructure('auth', 'lib/');
}
