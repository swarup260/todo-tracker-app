import 'package:flutter/material.dart';
import 'package:notes/flavours.dart';
import 'package:notes/models/note_list.dart';
import 'package:notes/models/note_provider.dart';
import 'package:notes/services/note_services.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class ActionBtn extends StatelessWidget {
  const ActionBtn({Key key}) : super(key: key);

  final IconData _icon = Icons.safety_divider;
  final String _actionName = '';

  @override
  Widget build(BuildContext context) {
    NoteProvider noteProvider =
        Provider.of<NoteProvider>(context, listen: false);
    return Container(
      padding: EdgeInsets.all(10),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(_icon, color: Colors.white),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: InkWell(
              onTap: () => callback(noteProvider.note, context),
              child: Text(
                _actionName,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> callback(Note note, BuildContext context) async {}
}

/* Save Note Action Btn */
class SaveActionBtn extends ActionBtn {
  const SaveActionBtn({Key key}) : super(key: key);

  final IconData _icon = Icons.save;
  final String _actionName = 'Save';

  Future<void> callback(Note note, BuildContext context) async {
    final flavours = Provider.of<Flavours>(context, listen: false);
    NoteList result;

    if (note.id != "") {
      result = await NoteServices(flavours).updateNote({
        "_id": note.id,
        "update": {"title": note.title, "body": note.body, "lable": note.label}
      });
    }

    if (note.id == "") {
      result = await NoteServices(flavours).writeNote(
          {"title": note.title, "body": note.body, "lable": note.label});
    }
    Navigator.pushNamed(context, '/', arguments: result);
  }
}

/* Make a Copy Action Btn */
class MakeACopyActionBtn extends ActionBtn {
  const MakeACopyActionBtn({Key key}) : super(key: key);

  final IconData _icon = Icons.copy_outlined;
  final String _actionName = 'Make a copy';

  Future<void> callback(Note note, BuildContext context) async {
    final flavours = Provider.of<Flavours>(context, listen: false);

    NoteList result = await NoteServices(flavours).writeNote(
        {"title": note.title, "body": note.body, "lable": note.label});

    Navigator.pushNamed(context, '/', arguments: result);
  }
}

/* Share Action Btn */
class ShareActionBtn extends ActionBtn {
  const ShareActionBtn({Key key}) : super(key: key);

  final IconData _icon = Icons.share;
  final String _actionName = 'Share';

  Future<void> callback(Note note, BuildContext context) async {
    Share.share('Title : ${note.title} \n Body : ${note.body}');
  }
}

/* Labels Action Btn */
class LabelsActionBtn extends StatefulWidget {
  const LabelsActionBtn({Key key}) : super(key: key);

  @override
  State<LabelsActionBtn> createState() => _LabelsActionBtnState();
}

class _LabelsActionBtnState extends State<LabelsActionBtn> {
  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final IconData _icon = Icons.label;
  final String _actionName = 'Label';

  @override
  Widget build(BuildContext context) {
    NoteProvider noteProvider =
        Provider.of<NoteProvider>(context, listen: false);
    return Container(
      padding: EdgeInsets.all(10),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(_icon, color: Colors.white),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: InkWell(
              onTap: () => callback(noteProvider.note, context),
              child: Text(
                _actionName,
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> callback(Note note, BuildContext context) async {
    NoteProvider noteProvider =
        Provider.of<NoteProvider>(context, listen: false);
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text('Set Label'),
              content: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Label',
                ),
                onChanged: (val) {
                  note.label = val;
                  noteProvider.updatenote(note);
                },
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Submit'),
                  onPressed: () => Navigator.of(context).pop(),
                )
              ]);
        });
  }
}

/* Delete Note Action Btn */
class DeleteNoteActionBtn extends ActionBtn {
  const DeleteNoteActionBtn({Key key}) : super(key: key);

  final IconData _icon = Icons.delete;
  final String _actionName = 'Delete note';

  Future<void> callback(Note note, BuildContext context) async {
    final flavours = Provider.of<Flavours>(context, listen: false);

    NoteList result = await NoteServices(flavours).deleteNote(note.id);
    Navigator.pushNamed(context, '/', arguments: result);
  }
}
