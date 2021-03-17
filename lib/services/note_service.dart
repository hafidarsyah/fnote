import 'package:noteapp/models/note_model.dart';
import 'package:noteapp/repositories/repository.dart';

class NoteService {
  Repository _repository = Repository();

  // save note
  saveNote(NoteModel noteModel) async {
    return await _repository.insertData('notes', noteModel.noteMap());
  }

  // read note
  readNotes() async {
    return await _repository.readData('notes', 'id');
  }

  // read note by id
  readNoteById(id) async {
    return await _repository.readDataByColumn('notes', 'id', id);
  }

  // update note
  updateNote(NoteModel noteModel) async {
    return await _repository.updateData('notes', noteModel.noteMap());
  }

  // delete note
  deleteNote(id) async {
    return await _repository.deleteData('notes', id);
  }
}
