import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes/models/note_list.dart';

// ignore: must_be_immutable
class AddNoteSubtitle extends StatefulWidget {
  final Note note;
  AddNoteSubtitle({Key key, this.note}) : super(key: key);

  @override
  _AddNoteSubtitleState createState() => _AddNoteSubtitleState();
}

class _AddNoteSubtitleState extends State<AddNoteSubtitle> {
  DateTime today = DateTime.now();
  DateFormat newFormat = DateFormat("E,h:m");

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          '${newFormat.format(today)} | ${widget.note.body.length} characters',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 15.0),
        ),
      ),
    );
  }
}
