import 'package:flutter/material.dart';
import 'package:meme_generator/data/file_processor.dart';
import 'package:meme_generator/entity/label_struct.dart';
import 'dart:io';
import 'package:screenshot/screenshot.dart';

class ScreenshotMaker {
  static Future<String> getCachedImagePath(String pathToBackgroundImage,
      {List<LabelStruct> labels = const [], Offset size = const Offset(200, 200)}) async {
    final encodedImage =
        await ScreenshotController().captureFromWidget(_WidgetToCapture(size, pathToBackgroundImage, labels));
    final fileName = pathToBackgroundImage.split('/').last;

    final cachedFilePath = await FileProcessor.getUniqueName(fileName);
    final path = await FileProcessor.saveFile(cachedFilePath, encodedImage);
    return path;
  }
}

class _WidgetToCapture extends StatelessWidget {
  final Offset size;
  final String pathToBackgroundImage;
  final List<LabelStruct> labels;
  const _WidgetToCapture(this.size, this.pathToBackgroundImage, this.labels);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(
        height: size.dy,
        width: size.dx,
        child: Stack(children: [
          Center(
            child: Image.file(
              File(pathToBackgroundImage),
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
    );
  }
}
