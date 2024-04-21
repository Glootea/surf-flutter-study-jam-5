import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meme_generator/data/database.dart';
import 'package:meme_generator/data/screenshot_maker.dart';

class PickFileCubit extends Cubit<bool> {
  final MemeDatabase database;
  PickFileCubit(this.database) : super(false);
  Future<void> pickFileFromGallery(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result == null) {
      if (context.mounted) {
        GoRouter.of(context).pop();
      }
      return;
    }
    emit(true);
    for (final file in result.files) {
      final path = file.path;
      if (path != null) {
        await database.addMeme(path, await ScreenshotMaker.getCachedImagePath(path));
      }
    }
    if (context.mounted) {
      GoRouter.of(context).pop();
    }
  }

  Future<void> pickFileFromLink(BuildContext context, String link) async {
    // TODO: implement pickFileFromLink
    GoRouter.of(context).pop();
  }
}
