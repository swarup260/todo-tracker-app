import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class AddNoteSubtitle extends StatelessWidget {
  AddNoteSubtitle({  Key key }) : super(key: key);

  DateTime today = DateTime.now();
  DateFormat newFormat = DateFormat("E,h:m");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          '${newFormat.format(today)} | 4065 characters',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 15.0),
        ),
      ),
    );
  }
}
