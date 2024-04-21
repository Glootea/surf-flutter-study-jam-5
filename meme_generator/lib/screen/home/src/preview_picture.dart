import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:meme_generator/screen/home/home_cubit.dart';
import 'package:meme_generator/entity/meme_struct.dart';
import 'package:meme_generator/router/router.dart';

class MemePreview extends StatelessWidget {
  const MemePreview(this.meme, {super.key});
  final MemeStruct meme;
  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeScreenState, bool>(
        selector: (state) => state.selectedItemIDs.contains(meme.id),
        builder: (context, selected) => selected ? _Selected(meme) : _NotSelected(meme));
  }
}

class _Selected extends StatelessWidget {
  final MemeStruct meme;
  const _Selected(this.meme);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeCubit>();
    return Card(
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        // decoration: BoxDecoration(
        //     border: Border.all(color: Theme.of(context).dividerColor),
        //     borderRadius: const BorderRadius.all(Radius.circular(16))),
        child: GestureDetector(
          onTap: () => bloc.removeSelectedItem(meme.id),
          child: Stack(fit: StackFit.expand, children: [
            Center(child: Image.file(File(meme.previewUrl))),
            Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () => bloc.removeSelectedItem(meme.id),
                  icon: Icon(Icons.check_circle_rounded, color: Theme.of(context).colorScheme.primary),
                )),
          ]),
        ));
  }
}

class _NotSelected extends StatelessWidget {
  final MemeStruct meme;
  const _NotSelected(this.meme);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeScreenState>(
      builder: (context, state) => Card(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Theme.of(context).dividerColor),
              borderRadius: const BorderRadius.all(Radius.circular(16))),
          // decoration: BoxDecoration(
          //     border: Border.all(color: Theme.of(context).dividerColor),
          //     borderRadius: const BorderRadius.all(Radius.circular(16))),
          child: GestureDetector(
            onLongPress: () => bloc.addSelectedItem(meme.id),
            onTap: () => state.isSelectingMode ? bloc.addSelectedItem(meme.id) : EditorRoute(id: meme.id).push(context),
            child: Center(child: Image.file(File(meme.previewUrl))),
          )),
    );
  }
}

// Stack(children: [
//       GestureDetector(
//           onTap: () async {
//             final _ = await Navigator.pushReplacement(
//                 context, MaterialPageRoute(builder: (context) => MemeGeneratorScreen(memes[count])));
//           },
//           child: Center(
//               child: Image.file(
//             File(memes[count].previewUrl),
//           ))),
//       Align(
//           alignment: Alignment.topRight,
//           child: OutlinedButton(
//             style: ButtonStyle(
//                 shape: MaterialStateProperty.all(const CircleBorder()),
//                 backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.surface)),
//             onPressed: () async {
//               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                   content: Row(
//                 children: [
//                   const Expanded(child: Text("Вы уверены, что хотите удалить?")),
//                   TextButton(
//                       onPressed: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
//                       child: const Text("Отмена")),
//                   TextButton(
//                       onPressed: () async {
//                         ScaffoldMessenger.of(context).hideCurrentSnackBar();
//                         await db.deleteMeme(memes[count].id);
//                         setState(() {});
//                       },
//                       child: const Text("Удалить"))
//                 ],
//               )));
//             },
//             child: Icon(
//               Icons.delete_outline,
//               color: Theme.of(context).colorScheme.error,
//             ),
//           )),
//     ]);