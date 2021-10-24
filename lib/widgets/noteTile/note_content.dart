import 'package:flutter/material.dart';


class NoteContent extends StatelessWidget {
  const NoteContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          '''Add them. The assertion here will help remind us of that higher up in the call stack, since this assertion would otherwise fire somewhere in the framework Add them. The assertion here will help remind us of that higher up in the call stack, since this assertion would otherwise fire somewhere in the framework ,Add them. The assertion here will help remind us of that higher up in the call stack, since this assertion would otherwise fire somewhere in the framework''',
          overflow: TextOverflow.ellipsis,
          maxLines: 5,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

