import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes/models/note_list.dart';

// ignore: must_be_immutable
class NoteLabels extends StatelessWidget {
  NoteLabels({Key key, @required this.note}) : super(key: key);

  DateFormat newFormat = DateFormat("E,h:m");
  final Note note;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                note.label ?? 'default',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white),
              ),
            ),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text("${newFormat.format(note.createdAt)}",
              style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
