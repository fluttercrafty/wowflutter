import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:wowflutter/logging/logger.dart';

class JsonCacheManager {
  final String fileName;

  JsonCacheManager(this.fileName);

  Future<String> _getLocalPath() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> _getLocalFile() async {
    final path = await _getLocalPath();
    return File('$path/$fileName');
  }

  Future<dynamic> readCache() async {
    try {
      final file = await _getLocalFile();
      if (await file.exists()) {
        String contents = await file.readAsString();
        return json.decode(contents);
      }
      return null;
    } catch (e) {
      TLoggerHelper.info('Error reading cache: $e');
      return null;
    }
  }

  Future<void> writeCache(dynamic data) async {
    try {
      final file = await _getLocalFile();
      await file.writeAsString(json.encode(data), flush: true);
    } catch (e) {
      TLoggerHelper.info('Error writing cache: $e');
    }
  }

  Future<void> clearCache() async {
    try {
      final file = await _getLocalFile();
      if (await file.exists()) {
        await file.delete();
        TLoggerHelper.info('Cache cleared for $fileName');
      }
    } catch (e) {
      TLoggerHelper.info('Error clearing cache: $e');
    }
  }
}

Future<void> clearAllJsonCaches() async {
  try {
    final directory = await getApplicationDocumentsDirectory();
    final cacheDir = Directory(directory.path);

    if (await cacheDir.exists()) {
      final cacheFiles = cacheDir.listSync();

      for (var file in cacheFiles) {
        if (file is File && file.path.endsWith('.json')) {
          await file.delete();
          TLoggerHelper.info('Deleted cache file: ${file.path}');
        }
      }
      TLoggerHelper.debug('All JSON cache files cleared.');
    }
  } catch (e) {
    TLoggerHelper.error('Error clearing JSON cache files: $e');
  }
}
