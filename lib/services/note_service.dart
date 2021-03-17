import 'package:noteapp/models/note_model.dart';
import 'package:noteapp/repositories/repository.dart';

class NoteService {
  Repository _repository = Repository();

  saveNote(NoteModel noteModel) async {
    return await _repository.insertData('note', noteModel.noteMap());
  }
}
