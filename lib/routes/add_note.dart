import 'package:flutter/material.dart';
import 'package:notes/widgets/action_widget_btn.dart';
import 'package:notes/widgets/addNote/add_note_body.dart';
import 'package:notes/widgets/addNote/bottom_modal_sheet.dart';

/* MyStaggeredTile */
// ignore: must_be_immutable
class AddNote extends StatefulWidget {
  String title;
  AddNote({Key key, this.title}) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  
  List<String> _actions = [
    'Save',
    'Make a copy',
    'Share',
    'Labels',
    'Delete note',
  ];
  List<Icon> _actionIcons = [
    Icon(Icons.save, color: Colors.white),
    Icon(Icons.copy_outlined, color: Colors.white),
    Icon(Icons.share, color: Colors.white),
    Icon(Icons.label, color: Colors.white),
    Icon(Icons.delete, color: Colors.white),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: AddNoteBody(),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      title: Text(widget.title),
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
          return BottomModalSheet(actions: _actions, actionIcons: _actionIcons);
        });
  }
}




