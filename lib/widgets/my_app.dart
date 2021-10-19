import 'package:flutter/material.dart';
import 'package:notes/utils/notes_color.dart';
import 'package:notes/widgets/add_note.dart';
// import 'package:notes/widgets/animation.dart';
import 'package:notes/widgets/my_homepage.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: 'Notes'),
        '/addNote': (context) => AddNote(title: '')
      },
      theme: ThemeData(
        primarySwatch: NotesColor.noteColor,
      ),
    );
  }
}
