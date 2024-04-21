import 'package:bloc/bloc.dart';
import 'package:meme_generator/data/database.dart';
import 'package:meme_generator/entity/meme_struct.dart';

class EditBloc extends Cubit<MemeStruct> {
  final MemeDatabase database;
  final int id;
  EditBloc(this.database, this.id) : super(const MemeStruct.empty());
}
