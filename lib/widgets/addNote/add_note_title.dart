import 'package:flutter/material.dart';
import 'package:notes/utils/notes_color.dart';

// ignore: must_be_immutable
class AddNoteTitle extends StatelessWidget {
  AddNoteTitle({ Key key }) :super(key: key);

  final TextEditingController _controller = TextEditingController();
  FocusNode _node = FocusNode(debugLabel: 'Button');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: EditableText(
          controller: _controller,
          focusNode: _node,
          maxLines: 1,
          style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold),
          cursorColor: NotesColor.noteColor[500],
          backgroundCursorColor: NotesColor.noteColor),
    );
  }
}