import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:meme_generator/database.dart';
import 'package:meme_generator/screen/home_screen.dart';
import 'package:meme_generator/screenshot_helper.dart';
import 'package:path_provider/path_provider.dart';

import 'package:provider/provider.dart';

class PickFileScreen extends StatefulWidget {
  const PickFileScreen({super.key});

  @override
  State<PickFileScreen> createState() => _PickFileScreenState();
}

class _PickFileScreenState extends State<PickFileScreen> {
  late final MemeDatabase db;
  bool processing = false;
  @override
  void initState() {
    db = context.read<MemeDatabase>();
    super.initState();
  }

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Выберите изображение')),
      body: processing
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    TextButton(
                      onPressed: () async {},
                      //   try {
                      //     final path = controller.text;

                      //     Response response = await Dio().get(
                      //       path,

                      //       //Received data with List<int>
                      //       options: Options(
                      //           responseType: ResponseType.bytes,
                      //           followRedirects: false,
                      //           validateStatus: (status) {
                      //             return (status ?? 200) < 500;
                      //           }),
                      //     );
                      //     final donwloadedPath = (await getApplicationCacheDirectory()).path +
                      //         '/' +
                      //         path.replaceAll('/', '-').replaceAll('.', '-').replaceAll(":", '-') +
                      //         '.webp';
                      //     File file = await File(donwloadedPath).writeAsBytes(response.data);

                      //     await db.addMeme(file.path, await ScreenshotHelper.getCachedImagePath(file.path));
                      //     Navigator.pushReplacement(
                      //         context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                      //   } catch (e) {
                      //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Ошибка загрузки")));
                      //     Navigator.pushReplacement(
                      //         context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                      //   }
                      // },
                      child: const Text('Ссылка', textAlign: TextAlign.left),
                    ),
                    Expanded(
                      child: TextField(
                        onTapOutside: (event) => FocusScope.of(context).unfocus(),
                        controller: controller,
                        decoration: const InputDecoration(labelText: 'Ссылка на изображение'),
                      ),
                    ),
                  ]),
                  const SizedBox(height: 16),
                  const Divider(),
                  TextButton(
                    onPressed: () async {
                      FilePickerResult? result = await FilePicker.platform.pickFiles(
                        type: FileType.image,
                      );
                      if (result == null) {
                        if (mounted) {
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                        }
                        return;
                      }

                      setState(() => processing = true);
                      for (final file in result.files) {
                        final path = file.path;
                        if (path != null) {
                          await db.addMeme(path, await ScreenshotHelper.getCachedImagePath(path));
                        }
                      }

                      if (mounted) {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                      }
                    },
                    child: const Text('Выбрать из галереи', textAlign: TextAlign.left),
                  )
                ],
              ),
            ),
    );
  }
}
