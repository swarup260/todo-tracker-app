import 'package:flutter/material.dart';
import 'package:notes/models/note_list.dart';
import 'package:notes/utils/notes_color.dart';

// ignore: must_be_immutable
class AddNoteContent extends StatefulWidget {
  Note note;
  AddNoteContent({Key key, this.note}) : super(key: key);

  @override
  _AddNoteContentState createState() => _AddNoteContentState();
}

class _AddNoteContentState extends State<AddNoteContent> {
  final TextEditingController _controllerContent = TextEditingController();

  FocusNode _nodeContent = FocusNode(debugLabel: 'Button');

  @override
  void initState() {
    super.initState();
    _controllerContent.text = widget.note.body;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: EditableText(
            controller: _controllerContent,
            focusNode: _nodeContent,
            onChanged: (value) => print(value.length),
            maxLines: null,
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w100),
            cursorColor: NotesColor.noteColor[500],
            backgroundCursorColor: NotesColor.noteColor),
      ),
    );
  }
}
