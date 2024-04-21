import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meme_generator/data/database.dart';
import 'package:meme_generator/screen/home/home_cubit.dart';
import 'package:meme_generator/entity/meme_struct.dart';
import 'package:meme_generator/router/router.dart';
import 'package:meme_generator/screen/home/src/preview_picture.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

part 'src/app_bar.dart';

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
    imageCache.clear();
    context.read<HomeCubit>().getMemes();
    return Scaffold(
      appBar: _HomeScreenAppBar(),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => context.read<HomeCubit>().deselectAll(),
          child: BlocSelector<HomeCubit, HomeScreenState, List<MemeStruct>>(
              selector: (state) => state.memes,
              builder: (context, memes) {
                return memes.isEmpty
                    ? const Center(child: Text("Здесь будут ваши шаблоны мемов"))
                    : GridView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: horizontalItemCount, mainAxisSpacing: 4, crossAxisSpacing: 4),
                        itemCount: memes.length,
                        itemBuilder: (context, count) {
                          return MemePreview(memes[count]);
                        });
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final _ = PickFileRoute().push(context);
          },
          child: const Icon(Icons.add)),
    );
  }
}
