import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes/models/note_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddNoteSubtitle extends StatelessWidget {
  AddNoteSubtitle({Key key}) : super(key: key);

  DateFormat newFormat = DateFormat("E,h:m");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Consumer<NoteProvider>(
          builder: (context, noteProvider, child) {
            return Text(
                '${newFormat.format(noteProvider.note.createdAt)} | ${noteProvider.note.body.length} characters',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 15.0));
          },
        ),
      ),
    );
  }
}
