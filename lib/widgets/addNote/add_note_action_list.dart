import 'package:flutter/material.dart';
import 'package:notes/models/note_provider.dart';
import 'package:provider/provider.dart';

class AddNoteActionList extends StatelessWidget {
  const AddNoteActionList({
    Key key,
    @required List<Map<String, dynamic>> actions,
  })  : _actions = actions,
        super(key: key);

  final List<Map<String, dynamic>> _actions;

  @override
  Widget build(BuildContext context) {
    NoteProvider noteProvider =
        Provider.of<NoteProvider>(context, listen: false);
    return ListView.builder(
        itemCount: _actions.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _actions[index]['icon'],
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: InkWell(
                    onTap: () => _actions[index]['callback'](noteProvider.note , context),
                    child: Text(
                      _actions[index]['key'],
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
