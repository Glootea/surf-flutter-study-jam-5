import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meme_generator/entity/label_struct.dart';
part 'meme_struct.freezed.dart';

@freezed
class MemeStruct with _$MemeStruct {
  const factory MemeStruct({
    required int id,
    required String backgroundImagePath,
    required String previewImagePath,
    required List<LabelStruct> labels,
  }) = _MemeStruct;
  const MemeStruct._();
  factory MemeStruct.empty() => const MemeStruct(
        id: 0,
        backgroundImagePath: '',
        previewImagePath: '',
        labels: [],
      );
}
