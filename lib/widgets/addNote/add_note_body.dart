import 'package:flutter/material.dart';

import 'package:notes/widgets/addNote/add_note_content.dart';
import 'package:notes/widgets/addNote/add_note_subtitle.dart';
import 'package:notes/widgets/addNote/add_note_title.dart';

// ignore: must_be_immutable
class AddNoteBody extends StatelessWidget {
  const AddNoteBody({Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            AddNoteTitle(),
            AddNoteSubtitle(),
            AddNoteContent()
          ],
        ),
      ),
    );
  }
}
