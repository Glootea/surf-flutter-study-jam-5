import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

class FileProcessor {
  static Future<String> get _defaultPath async =>
      getApplicationDocumentsDirectory().then((directory) => '${directory.path}/');

  static Future<String> saveFile(String name, Uint8List content) async {
    final file = File(await _defaultPath + name);
    await file.writeAsBytes(content);
    return file.path;
  }

  static Future<void> deleteFile(String name) async => File(await _defaultPath + name).delete();

  static Future<String> getUniqueName(String name) async {
    String path = await _defaultPath;
    String getFullPath() => path + name;

    while (await File(getFullPath()).exists()) {
      name += '1';
    }
    return name;
  }
}
