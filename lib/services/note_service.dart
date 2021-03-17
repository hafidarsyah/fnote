import 'package:noteapp/models/note_model.dart';
import 'package:noteapp/repositories/repository.dart';

class NoteService {
  Repository _repository = Repository();

  saveNote(NoteModel noteModel) async {
    return await _repository.insertData('notes', noteModel.noteMap());
  }

  readNotes() async {
    return await _repository.readData('notes', 'id');
  }

  readNoteById(id) async {
    return await _repository.readDataByColumn('notes', 'id', id);
  }

  updateNote(NoteModel noteModel) async {
    return await _repository.updateData('notes', noteModel.noteMap());
  }

  deleteNote(id) async {
    return await _repository.deleteData('notes', id);
  }
}
