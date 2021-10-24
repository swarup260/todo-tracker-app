import 'package:flutter/material.dart';
import 'package:notes/utils/notes_color.dart';
import 'package:notes/widgets/addNote/add_note_action_list.dart';

class BottomModalSheet extends StatelessWidget {
  const BottomModalSheet({
    Key key,
    @required List<String> actions,
    @required List<Icon> actionIcons,
  })  : _actions = actions,
        _actionIcons = actionIcons,
        super(key: key);

  final List<String> _actions;
  final List<Icon> _actionIcons;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
          color: NotesColor.noteColor[500],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Column(
        children: <Widget>[
          Expanded(
            child:
                AddNoteActionList(actions: _actions, actionIcons: _actionIcons),
          )
        ],
      ),
    );
  }
}
