import 'package:notes/models/note_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum sharedPreferencesKey { notes }

class CacheNoteServices {
  Future<NoteList> fetchPosts() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String _notes = _prefs.getString(sharedPreferencesKey.notes.toString());
    if (_notes == null) {
      return NoteList();
    }
    return noteListFromJson(_notes);
  }

  Future<void> addNote(Note result) async {
    NoteList _notes = await fetchPosts();
    _notes.data.add(result);
    saveNote(_notes);
  }

  Future<void> updateNote(Note result) async {
    NoteList _notes = await fetchPosts();
    for (int index = 0; index < _notes.data.length; index++) {
      Note note = _notes.data[index];
      if (result.id == note.id) {
        _notes.data[index] = result;
      }
    }
    saveNote(_notes);
  }

  Future<void> deleteNote(Note result) async {
    NoteList _notes = await fetchPosts();
    List<Note> newNote =
        _notes.data.where((Note element) => element.id != result.id).toList();
    _notes.data = newNote;
    saveNote(_notes);
  }

  Future<void> saveNote(NoteList result) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString(sharedPreferencesKey.notes.toString(), result.toString());
  }
}
