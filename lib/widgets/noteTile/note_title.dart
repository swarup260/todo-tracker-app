import 'package:flutter/material.dart';

class NoteTitle extends StatelessWidget {
  const NoteTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          'Title',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
    );
  }
}
