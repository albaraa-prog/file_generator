import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;

class FileGenerator {
  /// Generates a file at the given [path] with the provided [content].
  Future<void> generateFile({
    required String path,
    required String fileName,
    required String content,
  }) async {
    final directory = Directory(path);

    // Check if the directory exists, create it if not
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
    }

    final file = File(p.join(directory.path, fileName));

    // Write the content to the file
    await file.writeAsString(content);

    if (kDebugMode) {
      print('File created at: ${file.path}');
    }
  }

  /// Generates the Bloc file structure at the given [path] for a [featureName].
  Future<void> generateBlocStructure(String featureName, String path) async {
    final blocDirectory = '$path/$featureName';

    // Define the files and their content
    final files = {
      '${featureName}_bloc.dart': _blocContent(featureName),
      '${featureName}_event.dart': _eventContent(featureName),
      '${featureName}_state.dart': _stateContent(featureName),
    };

    // Generate each file
    for (var entry in files.entries) {
      await generateFile(
        path: blocDirectory,
        fileName: entry.key,
        content: entry.value,
      );
    }

    if (kDebugMode) {
      print(
          'Bloc structure created for feature: $featureName\n Please Add equatable and flutter_bloc Packages in You pubspec.yaml');
    }
  }

  // Template for the Bloc file
  String _blocContent(String featureName) {
    final className = _toPascalCase(featureName);
    return '''
import 'package:bloc/bloc.dart';
import '${featureName}_event.dart';
import '${featureName}_state.dart';

class ${className}Bloc extends Bloc<${className}Event, ${className}State> {
  ${className}Bloc() : super(${className}Initial()) {
    on<${className}Event>((event, emit) {
      // TODO: Implement event handlers
    });
  }
}
''';
  }

  // Template for the Event file
  String _eventContent(String featureName) {
    final className = _toPascalCase(featureName);
    return '''
import 'package:equatable/equatable.dart';

abstract class ${className}Event extends Equatable {
  const ${className}Event();

  @override
  List<Object> get props => [];
}

// Add your custom events here
''';
  }

  // Template for the State file
  String _stateContent(String featureName) {
    final className = _toPascalCase(featureName);
    return '''
import 'package:equatable/equatable.dart';

abstract class ${className}State extends Equatable {
  const ${className}State();

  @override
  List<Object> get props => [];
}

class ${className}Initial extends ${className}State {}
''';
  }

  // Helper function to convert a feature name to PascalCase
  String _toPascalCase(String text) {
    return text
        .split('_')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join('');
  }
}
