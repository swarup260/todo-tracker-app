import 'package:flutter/material.dart';
import 'package:notes/models/note_provider.dart';
import 'package:notes/utils/notes_color.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AddNoteTitle extends StatefulWidget {
  AddNoteTitle({Key key}) : super(key: key);

  @override
  _AddNoteTitleState createState() => _AddNoteTitleState();
}

class _AddNoteTitleState extends State<AddNoteTitle> {
  TextEditingController _controller = TextEditingController();
  FocusNode _node = FocusNode(debugLabel: 'Button');

  @override
  Widget build(BuildContext context) {
    NoteProvider noteProvider =
        Provider.of<NoteProvider>(context, listen: false);
    _controller.text = noteProvider.note.title;
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: EditableText(
          controller: _controller,
          focusNode: _node,
          onChanged: (String value) {
            noteProvider.note.title = value;
            noteProvider.updatenote(noteProvider.note);
          },
          maxLines: 2,
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          cursorColor: NotesColor.noteColor[500],
          backgroundCursorColor: NotesColor.noteColor),
    );
  }
}
