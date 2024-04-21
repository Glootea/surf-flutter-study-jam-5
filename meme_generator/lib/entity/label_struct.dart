import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'label_struct.freezed.dart';

@freezed
class LabelStruct with _$LabelStruct {
  const factory LabelStruct({
    required int id,
    required String text,
    required Offset offset,
    required Color color,
    required double scale,
  }) = _LabelStruct;
  static LabelStruct getDefault(int id) => LabelStruct(
        id: id,
        text: '',
        offset: const Offset(100, 100),
        color: Colors.white,
        scale: 1,
      );
}
