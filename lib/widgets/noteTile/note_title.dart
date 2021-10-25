import 'package:flutter/material.dart';
import 'package:notes/models/note_list.dart';

class NoteTitle extends StatelessWidget {
  const NoteTitle({Key key, @required this.note}) : super(key: key);

  final Datum note;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          note.title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
