import 'package:flutter/foundation.dart';
import 'package:notes/models/note_list.dart';

class NoteProvider extends ChangeNotifier {
  Note _note;

  NoteProvider(this._note);

  Note get note => _note;

  void updatenote(Note note) {
    _note = note;
    notifyListeners();
  }
}
