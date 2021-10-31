import 'package:flutter/material.dart';
import 'package:notes/models/note_provider.dart';
import 'package:notes/utils/notes_color.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddNoteContent extends StatelessWidget {
  AddNoteContent({Key key}) : super(key: key);

  final TextEditingController _controllerContent = TextEditingController();

  FocusNode _nodeContent = FocusNode(debugLabel: 'Button');

  @override
  Widget build(BuildContext context) {
    NoteProvider noteProvider =
        Provider.of<NoteProvider>(context, listen: false);
    _controllerContent.text = noteProvider.note.body;
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: EditableText(
            controller: _controllerContent,
            focusNode: _nodeContent,
            onChanged: (String value) {
              noteProvider.note.body = value;
              noteProvider.updatenote(noteProvider.note);
            },
            maxLines: null,
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w100),
            cursorColor: NotesColor.noteColor[500],
            backgroundCursorColor: NotesColor.noteColor),
      ),
    );
  }
}
