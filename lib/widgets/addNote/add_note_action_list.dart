import 'package:flutter/material.dart';
import 'package:notes/widgets/addNote/action_btn.dart';

class AddNoteActionList extends StatelessWidget {
  const AddNoteActionList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          SaveActionBtn(),
          MakeACopyActionBtn(),
          ShareActionBtn(),
          LabelsActionBtn(),
          DeleteNoteActionBtn()
        ],
      ),
    );
  }
}
