import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:ui';
import 'package:meme_generator/data/database.dart';
import 'package:meme_generator/data/screenshot_maker.dart';
import 'package:meme_generator/entity/label_struct.dart';
import 'package:meme_generator/entity/meme_struct.dart';

part 'edit_cubit.freezed.dart';

class EditCubit extends Cubit<EditCubitState> {
  final MemeDatabase database;
  final int memeID;
  EditCubit(this.database, this.memeID) : super(EditCubitState.empty());

  Future<void> init() async {
    await database.getMeme(memeID).then((meme) => emit(EditCubitState(meme: meme)));
  }

  Future<void> addLabel() async {
    final labelID = await database.addLabel(memeID);
    emit(state.copyWith(meme: state.meme.copyWith(labels: [...state.meme.labels, LabelStruct.getDefault(labelID)])));
  }

  Future<void> deleteLabel(int id) async {
    await database.deleteLabel(id);
    emit(state.copyWith(
        meme: state.meme.copyWith(labels: state.meme.labels.where((element) => element.id != id).toList())));
  }

  Future<void> saveUpdatedLabel(LabelStruct label) async => await database.updateLabel(label, state.meme.id);
  void setActiveLabel(int id) => emit(state.copyWith(activeLabelIndex: id));
  Future<void> updatePreviewPicture(Offset size) async {
    final path = await ScreenshotMaker.getCachedImagePath(
      state.meme.backgroundImagePath,
      labels: state.meme.labels,
      size: size,
    );
    emit(state.copyWith(meme: state.meme.copyWith(previewImagePath: path)));
    await database.updatePreviewPicture(state.meme.id, path);
  }
}

@freezed
class EditCubitState with _$EditCubitState {
  const factory EditCubitState({
    required MemeStruct meme,
    @Default(0) int activeLabelIndex,
  }) = _EditCubitState;
  const EditCubitState._();
  factory EditCubitState.empty() => EditCubitState(meme: MemeStruct.empty());

  bool get loading => meme.backgroundImagePath.isEmpty;
}
