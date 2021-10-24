import 'package:flutter/material.dart';

class AddNoteActionList extends StatelessWidget {
  const AddNoteActionList({
    Key key,
    @required List<String> actions,
    @required List<Icon> actionIcons,
  }) : _actions = actions, _actionIcons = actionIcons, super(key: key);

  final List<String> _actions;
  final List<Icon> _actionIcons;

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
                _actionIcons[index],
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: InkWell(
                    onTap: () => {},
                    child: Text(
                      _actions[index],
                      style: TextStyle(
                          color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}