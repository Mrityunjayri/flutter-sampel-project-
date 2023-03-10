import 'package:mj_hive_data_base/model/notes_model.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<NotesModel> getData() => Hive.box<NotesModel>('notes');
}
