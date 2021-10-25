import 'package:flutter/material.dart';
import 'package:notes/utils/notes_color.dart';
import 'package:notes/widgets/note_search.dart';
import 'package:notes/widgets/notes_list.dart';

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[NoteSearch(), NoteslistWidget()],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/addNote'),
        child: const Icon(Icons.note_add),
        backgroundColor: NotesColor.noteColor[100],
      ),
    );
  }
}
