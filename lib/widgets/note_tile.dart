import 'package:flutter/material.dart';
import 'package:notes/models/note_list.dart';
import 'package:notes/utils/notes_color.dart';
import 'package:notes/widgets/noteTile/note_content.dart';
import 'package:notes/widgets/noteTile/note_labels.dart';
import 'package:notes/widgets/noteTile/note_title.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({Key key, @required this.note}) : super(key: key);

  final Note note;

  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: NotesColor.noteColor[600]),
        child: Column(
          children: <Widget>[
            NoteTitle(note: note),
            NoteContent(note: note),
            NoteLabels(note: note)
          ],
        ));
  }
}
