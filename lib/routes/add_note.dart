import 'package:flutter/material.dart';
import 'package:notes/models/note_list.dart';
import 'package:notes/widgets/action_widget_btn.dart';
import 'package:notes/widgets/addNote/add_note_body.dart';
import 'package:notes/widgets/addNote/bottom_modal_sheet.dart';

/* MyStaggeredTile */
// ignore: must_be_immutable
class AddNote extends StatefulWidget {
  Datum note;
  AddNote({Key key, this.note}) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final List<Map<String, dynamic>> _actionList = [
    {'key': 'Save', 'icon': Icon(Icons.save, color: Colors.white)},
    {
      'key': 'Make a copy',
      'icon': Icon(Icons.copy_outlined, color: Colors.white)
    },
    {'key': 'Share', 'icon': Icon(Icons.share, color: Colors.white)},
    {'key': 'Labels', 'icon': Icon(Icons.label, color: Colors.white)},
    {'key': 'Delete note', 'icon': Icon(Icons.delete, color: Colors.white)},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      // body: Hero(tag: widget.note.id , child: AddNoteBody(note: widget.note)),
      body: AddNoteBody(note: widget.note),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: ActionWidgetButton(
        icon: Icons.close,
        callback: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        ActionWidgetButton(
          icon: Icons.redo,
          callback: () => {},
        ),
        ActionWidgetButton(
          icon: Icons.undo,
          callback: () => {},
        ),
        ActionWidgetButton(
          icon: Icons.check,
          callback: () => bottomModalSheet(context),
        )
      ],
    );
  }

  Future<void> bottomModalSheet(BuildContext context) {
    return showModalBottomSheet<void>(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return BottomModalSheet(actionList: _actionList);
        });
  }
}
