import 'package:flutter/material.dart';
import 'package:meme_generator/domain/label_struct.dart';

import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:screenshot/screenshot.dart';

class ScreenshotHelper {
  static Future<String> getCachedImagePath(String path,
      {List<LabelStruct> labels = const [], Offset size = const Offset(200, 200)}) async {
    return await ScreenshotController()
        .captureFromWidget((Material(
      child: SizedBox(
        height: size.dy,
        width: size.dx,
        child: Stack(children: [
          Center(
            child: Image.file(
              File(path),
              fit: BoxFit.contain,
            ),
          ),
          for (int i = 0; i < labels.length; i++)
            Positioned(
              left: labels[i].offset.dx,
              top: labels[i].offset.dy + 16,
              child: Text(labels[i].text,
                  style: TextStyle(color: labels[i].color).copyWith(fontSize: 20 * labels[i].scale)),
            ),
        ]),
      ),
    )))
        .then((image) async {
      final cachedFilePath = (await getApplicationDocumentsDirectory()).path + path.split('/').last;
      await File(cachedFilePath).writeAsBytes(image.buffer.asUint8List());
      return cachedFilePath;
    });
  }
}
