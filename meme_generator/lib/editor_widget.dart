import 'dart:io';
import 'package:flutter/material.dart';
import 'package:meme_generator/domain/meme_struct.dart';

class EditorWidget extends StatefulWidget {
  final MemeStruct meme;
  final Offset? size;
  final BoxFit? fit;
  const EditorWidget(this.meme, {this.size, this.fit, super.key});

  @override
  State<EditorWidget> createState() => _EditorWidgetState();
}

class _EditorWidgetState extends State<EditorWidget> {
  int? active;
  void setActive(int i) {
    active = i;
  }

  @override
  Widget build(BuildContext context) {
    active = widget.meme.labels.length - 1;
    return Column(children: [
      SizedBox(
        height: widget.size?.dx ?? MediaQuery.of(context).size.width,
        child: Stack(children: [
          Image.file(
            File(widget.meme.url),
            width: widget.size?.dx ?? MediaQuery.of(context).size.width,
            height: widget.size?.dx ?? MediaQuery.of(context).size.width,
            fit: widget.fit ?? BoxFit.contain,
          ),
          for (int i = 0; i < widget.meme.labels.length; i++) LabelWidget(widget.meme, i),
        ]),
      ),
      if (widget.meme.labels.isNotEmpty) const SizedBox(height: 8),
      if (widget.meme.labels.isNotEmpty)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
                onPressed: () => setState(() => widget.meme.labels[active ?? 0].color = Colors.white),
                child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle, border: Border.all(color: Colors.black)))),
            OutlinedButton(
                onPressed: () => setState(() => widget.meme.labels[active ?? 0].color = Colors.black),
                child: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ))),
            OutlinedButton(
                onPressed: () => setState(() => widget.meme.labels[active ?? 0].color = Colors.red),
                child: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ))),
            OutlinedButton(
                onPressed: () => setState(() => widget.meme.labels[active ?? 0].color = Colors.blue),
                child: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ))),
            OutlinedButton(
                onPressed: () => setState(() => widget.meme.labels[active ?? 0].color = Colors.green),
                child: Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ))),
          ],
        ),
      if (widget.meme.labels.isNotEmpty) const SizedBox(height: 8),
      if (widget.meme.labels.isNotEmpty)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
                onPressed: () => setState(() => widget.meme.labels[active ?? 0].scale *= 1.5),
                child: const Icon(Icons.text_increase_outlined)),
            OutlinedButton(
                onPressed: () => setState(() => widget.meme.labels[active ?? 0].scale /= 1.5),
                child: const Icon(Icons.text_decrease_outlined)),
            OutlinedButton(
                onPressed: () {
                  setState(() => widget.meme.labels.removeAt(active ?? 0));
                  active = null;
                },
                child: Icon(
                  Icons.delete_outline,
                  color: Theme.of(context).colorScheme.error,
                )),
          ],
        ),
      if (widget.meme.labels.isNotEmpty) const SizedBox(height: 8),
      if (widget.meme.labels.isNotEmpty)
        Text(
          "Кнопки для управления последним нажатым текстом",
          style: Theme.of(context).textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
    ]);
  }
}

class LabelWidget extends StatefulWidget {
  final MemeStruct meme;

  final int i;
  const LabelWidget(this.meme, this.i, {super.key});

  @override
  State<LabelWidget> createState() => _LabelWidgetState();
}

class _LabelWidgetState extends State<LabelWidget> {
  late final controller = TextEditingController(text: widget.meme.labels[widget.i].text);
  double get width =>
      (TextPainter(
              text: TextSpan(
                  text: widget.meme.labels[widget.i].text,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontSize: widget.meme.labels[widget.i].scale * 20)),
              textDirection: TextDirection.ltr)
            ..layout(minWidth: 0, maxWidth: double.infinity))
          .size
          .width +
      8;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.meme.labels[widget.i].offset.dx,
      top: widget.meme.labels[widget.i].offset.dy,
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            widget.meme.labels[widget.i].offset += details.delta;
          });
        },
        child: SizedBox(
          width: width,
          child: TextField(
            onTap: () => context.findAncestorStateOfType<_EditorWidgetState>()?.setActive(widget.i),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: widget.meme.labels[widget.i].color, fontSize: widget.meme.labels[widget.i].scale * 20),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
            onChanged: (value) => setState(() => widget.meme.labels[widget.i].text = value),
            controller: controller,
          ),
        ),
      ),
    );
  }
}
