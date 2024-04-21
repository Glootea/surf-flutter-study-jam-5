import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meme_generator/screen/editor/edit_cubit.dart';
import 'package:meme_generator/screen/editor/src/label_widget.dart';

class EditorWidget extends StatefulWidget {
  final Offset? size;

  const EditorWidget({this.size, super.key});

  @override
  State<EditorWidget> createState() => _EditorWidgetState();
}

class _EditorWidgetState extends State<EditorWidget> {
  @override
  void initState() {
    context.read<EditCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final imagePath = state.backgroundImagePath;

    return BlocBuilder<EditCubit, EditCubitState>(builder: (context, state) {
      return state.loading
          ? const Center(child: SizedBox(width: 100, height: 100, child: CircularProgressIndicator()))
          : Column(children: [
              SizedBox(
                height: widget.size?.dx ?? MediaQuery.of(context).size.width,
                child: Stack(children: [
                  Image.file(
                    File(state.meme.backgroundImagePath),
                    width: widget.size?.dx ?? MediaQuery.of(context).size.width,
                    height: widget.size?.dx ?? MediaQuery.of(context).size.width,
                    fit: BoxFit.contain,
                  ),
                  for (int i = 0; i < state.meme.labels.length; i++) LabelWidget(state.meme.labels[i].id),
                ]),
              )
            ]);
    });
  }
}
