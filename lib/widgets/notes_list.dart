import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:notes/widgets/note_tile.dart';

// ignore: must_be_immutable
class Noteslist extends StatelessWidget {
  Noteslist({Key key}) : super(key: key);

  DateTime today = DateTime.now();
  DateFormat newFormat = DateFormat("E,h:m");

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StaggeredGridView.countBuilder(
        padding: EdgeInsets.all(15),
        crossAxisCount: 4,
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) => InkWell(
          onTap: () => Navigator.pushNamed(context, '/addNote'),
          child: NoteTile(newFormat: newFormat, today: today),
        ),
        staggeredTileBuilder: (int index) {
          return new StaggeredTile.count(2, index.isEven ? 2 : 2.5);
        },
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
      ),
    );
  }
}


