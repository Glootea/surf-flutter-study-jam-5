import 'package:meme_generator/entity/label_struct.dart';

class MemeStruct {
  final int id;
  final String url;
  final String previewUrl;
  final List<LabelStruct> labels;
  const MemeStruct(this.id, this.url, this.previewUrl, this.labels);
  const MemeStruct._() : this(0, '', '', const []);
  const factory MemeStruct.empty() = MemeStruct._;
}
