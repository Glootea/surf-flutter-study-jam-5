import 'package:meme_generator/domain/label_struct.dart';

class MemeStruct {
  int id;
  String url;
  String previewUrl;
  List<LabelStruct> labels;
  MemeStruct(this.id, this.url, this.previewUrl, this.labels);
}
