import 'package:flutter/material.dart';
import 'package:notes/models/note_list.dart';
import 'package:notes/utils/notes_color.dart';

// ignore: must_be_immutable
class AddNoteTitle extends StatefulWidget {
  final Note note;
  AddNoteTitle({Key key, this.note}) : super(key: key);

  @override
  _AddNoteTitleState createState() => _AddNoteTitleState();
}

class _AddNoteTitleState extends State<AddNoteTitle> {
  TextEditingController _controller = TextEditingController();
  FocusNode _node = FocusNode(debugLabel: 'Button');

  @override
  void initState() {
    super.initState();
    _controller.text = widget.note.title;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: EditableText(
          controller: _controller,
          focusNode: _node,
          maxLines: 2,
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          cursorColor: NotesColor.noteColor[500],
          backgroundCursorColor: NotesColor.noteColor),
    );
  }
}
