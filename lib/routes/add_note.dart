import 'package:flutter/material.dart';
import 'package:notes/flavours.dart';
import 'package:notes/models/note_list.dart';
import 'package:notes/models/note_provider.dart';
import 'package:notes/services/note_services.dart';
import 'package:notes/widgets/action_widget_btn.dart';
import 'package:notes/widgets/addNote/add_note_body.dart';
import 'package:notes/widgets/addNote/bottom_modal_sheet.dart';
import 'package:provider/provider.dart';

/* MyStaggeredTile */
// ignore: must_be_immutable
class AddNote extends StatelessWidget {
  AddNote({Key key}) : super(key: key);

  List<Map<String, dynamic>> get _actionList => [
        {
          'key': 'Save',
          'icon': Icon(Icons.save, color: Colors.white),
          'callback': (Note note, BuildContext context) async {
            final flavours = Provider.of<Flavours>(context, listen: false);
            NoteList result;

            if (note.id != "") {
              result = await NoteServices(flavours).updateNote({});
            }

            if (note.id == "") {
              result = await NoteServices(flavours).writeNote({});
            }
            if (result.status) {
              Navigator.pushNamed(context, '/');
            }
            if (!result.status) {}
          }
        },
        {
          'key': 'Make a copy',
          'icon': Icon(Icons.copy_outlined, color: Colors.white),
          'callback': (Note note, BuildContext context) {
            print(note.toJson());
            Navigator.pushNamed(context, '/');
          }
        },
        {
          'key': 'Share',
          'icon': Icon(Icons.share, color: Colors.white),
          'callback': (Note note, BuildContext context) {
            print(note.toJson());
            Navigator.pushNamed(context, '/');
          }
        },
        {
          'key': 'Labels',
          'icon': Icon(Icons.label, color: Colors.white),
          'callback': (Note note, BuildContext context) {
            print(note.toJson());
          }
        },
        {
          'key': 'Delete note',
          'icon': Icon(Icons.delete, color: Colors.white),
          'callback': (Note note, BuildContext context) async {
            final flavours = Provider.of<Flavours>(context, listen: false);

            NoteList result = await NoteServices(flavours).deleteNote(note.id);

            if (result.status) {
              Navigator.pushNamed(context, '/');
            }
            if (!result.status) {}
          }
        },
      ];

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
              child: BottomModalSheet(actionList: _actionList));
        });
  }
}
