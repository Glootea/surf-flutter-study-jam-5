import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meme_generator/data/database.dart';
import 'package:meme_generator/data/file_processor.dart';
import 'package:meme_generator/entity/meme_struct.dart';

part 'home_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeScreenState> {
  final MemeDatabase database;
  HomeCubit(this.database) : super(const HomeScreenState());

  void getMemes() async {
    final memes = await database.getAllMemes();
    emit(state.copyWith(memes: memes));
  }

  void addSelectedItem(int id) => emit(state.copyWith(selectedItemIDs: state.selectedItemIDs.toSet()..add(id)));
  void removeSelectedItem(int id) => emit(state.copyWith(selectedItemIDs: state.selectedItemIDs.toSet()..remove(id)));

  void selectAll() => emit(state.copyWith(selectedItemIDs: state.memes.map((e) => e.id).toSet()));
  void deselectAll() => emit(state.copyWith(selectedItemIDs: {}));

  void deleteSelectedItems() async {
    for (final id in state.selectedItemIDs) {
      final meme = state.memes.firstWhere((element) => element.id == id);
      FileProcessor.deleteFile(meme.backgroundImagePath);
      FileProcessor.deleteFile(meme.previewImagePath);
      await database.deleteMeme(id);
    }
    final newMemes = state.memes.where((element) => !state.selectedItemIDs.contains(element.id)).toList();
    emit(state.copyWith(selectedItemIDs: {}, memes: newMemes));
  }
}

@freezed
class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState({@Default([]) List<MemeStruct> memes, @Default({}) Set<int> selectedItemIDs}) =
      _HomeScreenState;
  const HomeScreenState._();
  bool get isSelectingMode => selectedItemIDs.isNotEmpty;
}
