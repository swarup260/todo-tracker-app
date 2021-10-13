import 'package:flutter/material.dart';

class NoteSearch extends StatelessWidget {
  const NoteSearch({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        borderOnForeground: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search notes ...',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
        elevation: 5.0,
      ),
    );
  }
}