import 'package:flutter/material.dart';
import 'package:meme_generator/database.dart';
import 'package:meme_generator/domain/label_struct.dart';
import 'package:meme_generator/domain/meme_struct.dart';
import 'package:meme_generator/editor_widget.dart';
import 'package:meme_generator/screen/home_screen.dart';
import 'package:meme_generator/screenshot_helper.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class MemeGeneratorScreen extends StatefulWidget {
  final MemeStruct meme;
  const MemeGeneratorScreen(this.meme, {super.key});

  @override
  State<MemeGeneratorScreen> createState() => _MemeGeneratorScreenState();
}

class _MemeGeneratorScreenState extends State<MemeGeneratorScreen> {
  bool changed = false;
  late final db = context.read<MemeDatabase>();

  @override
  Widget build(BuildContext context) {
    final meme = widget.meme;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () =>
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen())),
            icon: const Icon(Icons.arrow_back_outlined)),
        actions: [
          IconButton(
              onPressed: () async => await db.updateMemeLabels(meme, size: Offset(width, width)).then((value) =>
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()))),
              icon: const Icon(Icons.save_outlined)),
          IconButton(
              onPressed: () async {
                await db.updateMemeLabels(meme, size: Offset(width, width));
                setState(() {});
                await Share.shareXFiles([
                  XFile(await ScreenshotHelper.getCachedImagePath(meme.url,
                      labels: meme.labels, size: Offset(width, width)))
                ], text: 'Посмотрите какой мем я сделал!!!');
              },
              icon: const Icon(Icons.share_outlined))
        ],
      ),
      body: EditorWidget(meme),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add_outlined),
          onPressed: () {
            setState(() {
              meme.labels.add(LabelStruct(meme.labels.length, "текст", const Offset(100, 100), Colors.white, 1));
            });
          }),
    );
  }
}
