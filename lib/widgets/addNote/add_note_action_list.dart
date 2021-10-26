import 'package:flutter/material.dart';

class AddNoteActionList extends StatelessWidget {
  const AddNoteActionList({
    Key key,
    @required List<Map<String, Icon>> actions,
  })  : _actions = actions,
        super(key: key);

  final List<Map<String, dynamic>> _actions;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _actions.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _actions[index]['key'],
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: InkWell(
                    onTap: () => {},
                    child: Text(
                      _actions[index]['icon'],
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
