import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meme_generator/entity/label_struct.dart';
import 'package:meme_generator/screen/editor/edit_cubit.dart';

class LabelWidget extends StatefulWidget {
  final int labelID;
  const LabelWidget(this.labelID, {super.key});

  @override
  State<LabelWidget> createState() => _LabelWidgetState();
}

class _LabelWidgetState extends State<LabelWidget> {
  final cardRadius = 16.0;
  final GlobalKey globalKey = GlobalKey();
  Size _boxSize = Size.zero;
  late final TextEditingController textController;
  @override
  void initState() {
    textController = TextEditingController(
        text: context.read<EditCubit>().state.meme.labels.firstWhere((element) => element.id == widget.labelID).text);
    updateBoxSize();
    super.initState();
  }

  void updateBoxSize() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => setState(() => _boxSize = getBoxSize(globalKey.currentContext!)));
  }

  Size getBoxSize(BuildContext context) {
    final box = context.findRenderObject() as RenderBox;
    return box.size;
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<EditCubit, EditCubitState, LabelStruct>(
        key: globalKey,
        selector: (state) => state.meme.labels.firstWhere((element) => element.id == widget.labelID),
        builder: (context, state) {
          final bloc = context.read<EditCubit>();
          return Positioned(
            left: state.offset.dx,
            top: state.offset.dy,
            child: Stack(clipBehavior: Clip.none, children: [
              DottedBorder(
                color: Colors.white,
                strokeWidth: 3,
                radius: Radius.circular(cardRadius),
                dashPattern: const [10, 5],
                customPath: (size) {
                  return Path()
                    ..moveTo(cardRadius, 0)
                    ..lineTo(size.width - cardRadius, 0)
                    ..arcToPoint(Offset(size.width, cardRadius), radius: Radius.circular(cardRadius))
                    ..lineTo(size.width, size.height - cardRadius)
                    ..arcToPoint(Offset(size.width - cardRadius, size.height), radius: Radius.circular(cardRadius))
                    ..lineTo(cardRadius, size.height)
                    ..arcToPoint(Offset(0, size.height - cardRadius), radius: Radius.circular(cardRadius))
                    ..lineTo(0, cardRadius)
                    ..arcToPoint(Offset(cardRadius, 0), radius: Radius.circular(cardRadius));
                },
                child: GestureDetector(
                  onPanStart: (details) => setState(() => bloc.setActiveLabel(state.id)),
                  onPanUpdate: (details) {
                    setState(() {
                      state = state.copyWith(offset: state.offset + details.delta);
                    });
                  },
                  child: ConstrainedBox(
                      constraints: const BoxConstraints(minWidth: 100),
                      child: IntrinsicWidth(
                          child: TextField(
                        textAlign: TextAlign.center,
                        onTap: () => bloc.setActiveLabel(state.id),
                        onTapOutside: (event) {
                          bloc.saveUpdatedLabel(state.copyWith(text: textController.text));
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        onEditingComplete: () => bloc.saveUpdatedLabel(state.copyWith(text: textController.text)),
                        onChanged: (value) {
                          state = state.copyWith(text: value);
                          updateBoxSize();
                        },
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: state.color, fontSize: state.scale * 20),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        maxLines: null,
                        controller: textController,
                      ))),
                ),
              ),
              Positioned(
                left: -8,
                height: _boxSize.height,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                ),
              ),
              Positioned(
                left: _boxSize.width - 8,
                height: _boxSize.height,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                ),
              ),
            ]),
          );
        });
  }
}
