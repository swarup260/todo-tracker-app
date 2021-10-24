import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes/utils/notes_color.dart';
import 'package:notes/widgets/noteTile/note_content.dart';
import 'package:notes/widgets/noteTile/note_labels.dart';
import 'package:notes/widgets/noteTile/note_title.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({
    Key key,
    @required this.newFormat,
    @required this.today,
  }) : super(key: key);

  final DateFormat newFormat;
  final DateTime today;

  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: NotesColor.noteColor[600]),
        child: Column(
          children: <Widget>[
            NoteTitle(),
            NoteContent(),
            NoteLabels(newFormat: newFormat, today: today)
          ],
        ));
  }
}





