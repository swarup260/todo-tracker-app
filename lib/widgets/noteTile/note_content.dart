import 'package:flutter/material.dart';
import 'package:notes/models/note_list.dart';

class NoteContent extends StatelessWidget {
  const NoteContent({Key key, @required this.note}) : super(key: key);

  final Datum note;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          note.body,
          overflow: TextOverflow.ellipsis,
          maxLines: 5,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
