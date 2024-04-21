import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meme_generator/entity/label_struct.dart';
import 'package:meme_generator/screen/editor/edit_cubit.dart';
import 'package:meme_generator/screen/editor/src/editor_widget.dart';
import 'package:share_plus/share_plus.dart';

class EditorScreen extends StatefulWidget {
  const EditorScreen({super.key});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<EditCubit>();
    final state = bloc.state;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              onPressed: () async {
                final width = MediaQuery.sizeOf(context).width;
                await bloc.updatePreviewPicture(Offset(width, width));
                if (context.mounted) {
                  GoRouter.of(context).pop();
                }
              },
              icon: const Icon(Icons.arrow_back_outlined)),
          actions: [
            IconButton(
                onPressed: () async {
                  final width = MediaQuery.sizeOf(context).width;
                  await bloc.updatePreviewPicture(Offset(width, width));
                  await Share.shareXFiles([XFile(bloc.state.meme.previewImagePath)],
                      text: 'Посмотрите какой мем я сделал!!!');
                },
                icon: const Icon(Icons.share_outlined))
          ],
        ),
        body: const EditorWidget(),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add_outlined),
            onPressed: () {
              bloc.addLabel();
            }));
  }
}
