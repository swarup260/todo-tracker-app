import 'package:flutter/material.dart';
import 'package:notes/utils/notes_color.dart';

// ignore: must_be_immutable
class ActionWidgetButton extends StatelessWidget {
  IconData icon;
  Function callback;
  ActionWidgetButton({Key key, this.icon, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        color: NotesColor.noteColor[200],
      ),
      onPressed: callback,
    );
  }
}
