import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:meme_generator/data/database.dart';
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
      await database.deleteMeme(id);
    }

    emit(state.copyWith(selectedItemIDs: {}));
  }

  void editMeme(BuildContext context, int id) => context.go('/edit/$id');
}

@freezed
class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState({@Default([]) List<MemeStruct> memes, @Default({}) Set<int> selectedItemIDs}) =
      _HomeScreenState;
  const HomeScreenState._();
  bool get isSelectingMode => selectedItemIDs.isNotEmpty;
}
