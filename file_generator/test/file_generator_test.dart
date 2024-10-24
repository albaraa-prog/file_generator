// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:file_generator/file_generator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;

void main() {
  late FileGenerator fileGenerator;
  late Directory libDirectory;

  setUp(() {
    fileGenerator = FileGenerator();
    // Define the current project directory to generate files in 'lib/'
    libDirectory = Directory(p.join(Directory.current.path, 'lib'));

    // Ensure the 'lib' directory exists
    if (!libDirectory.existsSync()) {
      libDirectory.createSync();
    }
  });

  group('FileGenerator', () {
    test(
        'should create a file with the correct content in the project lib folder',
        () async {
      final testPath = libDirectory.path;
      const testFileName = 'test_file.txt';
      const testContent = 'Hello, project!';

      // Act
      await fileGenerator.generateFile(
        path: testPath,
        fileName: testFileName,
        content: testContent,
      );

      // Assert
      final file = File(p.join(testPath, testFileName));
      expect(file.existsSync(), isTrue);
      expect(await file.readAsString(), testContent);
    });

    test('should create Bloc file structure for the given feature in lib/',
        () async {
      const featureName = 'auth';
      final testPath =
          libDirectory.path; // Points to the project’s lib directory

      // Act
      await fileGenerator.generateBlocStructure(featureName, testPath);

      // Assert
      final blocFile =
          File(p.join(testPath, featureName, '${featureName}_bloc.dart'));
      final eventFile =
          File(p.join(testPath, featureName, '${featureName}_event.dart'));
      final stateFile =
          File(p.join(testPath, featureName, '${featureName}_state.dart'));

      expect(blocFile.existsSync(), isTrue);
      expect(eventFile.existsSync(), isTrue);
      expect(stateFile.existsSync(), isTrue);

      expect(await blocFile.readAsString(), contains('class AuthBloc'));
      expect(
          await eventFile.readAsString(), contains('abstract class AuthEvent'));
      expect(
          await stateFile.readAsString(), contains('abstract class AuthState'));
    });

    test('should add flutter_bloc and equatable to pubspec.yaml', () async {
      // Act
      await fileGenerator.generateBlocStructure('auth', libDirectory.path);
    });
  });
}
