import 'package:flutter/material.dart';
import 'package:notes/models/note_provider.dart';
import 'package:notes/widgets/action_widget_btn.dart';
import 'package:notes/widgets/addNote/add_note_body.dart';
import 'package:notes/widgets/addNote/bottom_modal_sheet.dart';
import 'package:provider/provider.dart';


/* MyStaggeredTile */
// ignore: must_be_immutable
class AddNote extends StatelessWidget {
  AddNote({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: AddNoteBody(),
    );
  }

  AppBar appBar(BuildContext context) {
    NoteProvider noteProvider =
        Provider.of<NoteProvider>(context, listen: false);
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: ActionWidgetButton(
        icon: Icons.close,
        callback: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        ActionWidgetButton(
          icon: Icons.undo,
          callback: () => print(noteProvider.note.toJson()),
        ),
        ActionWidgetButton(
          icon: Icons.redo,
          callback: () => print(noteProvider.note.toJson()),
        ),
        ActionWidgetButton(
          icon: Icons.check,
          callback: () => bottomModalSheet(context),
        )
      ],
    );
  }

  Future<void> bottomModalSheet(BuildContext context) {
    NoteProvider noteProvider =
        Provider.of<NoteProvider>(context, listen: false);
    return showModalBottomSheet<void>(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context) {
          return ChangeNotifierProvider<NoteProvider>(
              create: (_) => NoteProvider(noteProvider.note),
              child: BottomModalSheet());
        });
  }
}
