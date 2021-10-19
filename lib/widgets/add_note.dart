import 'package:flutter/material.dart';
import 'package:notes/utils/notes_color.dart';
import 'package:notes/widgets/action_widget_btn.dart';

/* MyStaggeredTile */
// ignore: must_be_immutable
class AddNote extends StatefulWidget {
  String title;
  AddNote({Key key, this.title}) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final TextEditingController _controller = TextEditingController();
  FocusNode _node = FocusNode(debugLabel: 'Button');

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
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              EditableText(
                  controller: _controller,
                  focusNode: _node,
                  maxLines: 2,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  cursorColor: NotesColor.noteColor[500],
                  backgroundCursorColor: NotesColor.noteColor),
            ],
          ),
        ),
      ),
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
          return Container(
            height: 250,
            decoration: BoxDecoration(
                color: NotesColor.noteColor[500],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(
              children: <Widget>[
                // Flexible(
                //   child: Row(
                //     children: <Widget>[
                //       ListView.builder(
                //           itemCount: 3,
                //           itemBuilder: (BuildContext context, int index) {
                //             return Icon(Icons.circle);
                //           })
                //     ],
                //   ),
                // ),
                Expanded(
                  child: ListView.builder(
                      itemCount: _actions.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: EdgeInsets.all(10),
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _actionIcons[index],
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Text(
                                  _actions[index],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
          );
        });
  }
}


/* 

TextFormField(
            minLines: MediaQuery.of(context).size.width as int,
            keyboardType: TextInputType.multiline,
            maxLines: null,
          )
 */