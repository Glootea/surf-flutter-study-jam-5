import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:meme_generator/database.dart';
import 'package:meme_generator/domain/meme_struct.dart';
import 'package:meme_generator/screen/meme_generator_screen.dart';
import 'package:meme_generator/screen/pick_file.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final MemeDatabase db;
  late final ScreenshotController screenshotController;
  @override
  void initState() {
    db = context.read<MemeDatabase>();
    screenshotController = ScreenshotController();
    super.initState();
  }

  Future<bool> getPermission() async {
    var status = await Permission.mediaLibrary.request();
    if (status != PermissionStatus.granted) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext screenContext) {
    final width = MediaQuery.of(screenContext).size.width;
    final horizontalItemCount = width ~/ 200;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Ваши шаблоны мемов",
            style: Theme.of(screenContext).textTheme.titleLarge,
          ),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: db.getAllMemes(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                List<MemeStruct>? memes = snapshot.data;
                return memes?.isEmpty ?? true
                    ? const Center(child: Text("Здесь будут ваши шаблоны мемов"))
                    : Column(children: [
                        Expanded(
                            child: GridView.builder(
                                physics: const AlwaysScrollableScrollPhysics(),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: horizontalItemCount, mainAxisSpacing: 4, crossAxisSpacing: 4),
                                itemCount: memes!.length,
                                itemBuilder: (context, count) {
                                  if (snapshot.connectionState == ConnectionState.done) {
                                    return Stack(children: [
                                      GestureDetector(
                                          onTap: () async {
                                            final _ = await Navigator.pushReplacement(
                                                screenContext,
                                                MaterialPageRoute(
                                                  builder: (context) => MemeGeneratorScreen(memes[count]),
                                                ));
                                          },
                                          child: Center(child: Image.file(File(memes[count].previewUrl)))),
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: OutlinedButton(
                                            style: ButtonStyle(
                                                shape: MaterialStateProperty.all(const CircleBorder()),
                                                backgroundColor:
                                                    MaterialStateProperty.all(Theme.of(context).colorScheme.surface)),
                                            onPressed: () async {
                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                  content: Row(
                                                children: [
                                                  const Expanded(child: Text("Вы уверены, что хотите удалить?")),
                                                  TextButton(
                                                      onPressed: () =>
                                                          ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                                                      child: const Text("Отмена")),
                                                  TextButton(
                                                      onPressed: () async {
                                                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                                        await db.deleteMeme(memes[count].id);
                                                        setState(() {});
                                                      },
                                                      child: const Text("Удалить"))
                                                ],
                                              )));
                                            },
                                            child: Icon(
                                              Icons.delete_outline,
                                              color: Theme.of(context).colorScheme.error,
                                            ),
                                          )),
                                    ]);
                                  }
                                  return const Center(child: CircularProgressIndicator());
                                })),
                      ]);
              }
              return const Center(child: CircularProgressIndicator());
            }),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final _ = await Navigator.pushReplacement(
                screenContext, MaterialPageRoute(builder: (context) => const PickFileScreen()));
          },
          child: const Icon(Icons.add)),
    );
  }
}
