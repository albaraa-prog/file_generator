import 'dart:io';

import 'package:flutter/foundation.dart';

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

    final file = File('${directory.path}/$fileName');

    // Write the content to the file
    await file.writeAsString(content);

    if (kDebugMode) {
      print('File created at: ${file.path}');
    }
  }
}
