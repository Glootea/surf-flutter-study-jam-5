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
        child: GestureDetector(
          onTap: () => bloc.removeSelectedItem(meme.id),
          child: Stack(fit: StackFit.expand, children: [
            Center(child: Image.file(File(meme.previewImagePath))),
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
    const borderRadius = BorderRadius.all(Radius.circular(16));
    return BlocBuilder<HomeCubit, HomeScreenState>(
      builder: (context, state) => Card(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Theme.of(context).dividerColor), borderRadius: borderRadius),
          child: GestureDetector(
            onLongPress: () => bloc.addSelectedItem(meme.id),
            onTap: () => state.isSelectingMode ? bloc.addSelectedItem(meme.id) : EditorRoute(id: meme.id).push(context),
            child: ClipRRect(borderRadius: borderRadius, child: Image.file(File(meme.previewImagePath))),
          )),
    );
  }
}
