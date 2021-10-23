import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes/utils/notes_color.dart';
import 'package:notes/widgets/note_search.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  String title;
  MyHomePage({Key key, this.title}) : super(key: key);
  DateTime today = DateTime.now();
  DateFormat newFormat = DateFormat("E,h:m");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            NoteSearch(),
            Expanded(
              child: StaggeredGridView.countBuilder(
                padding: EdgeInsets.all(15),
                crossAxisCount: 4,
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) => InkWell(
                  onTap: () => Navigator.pushNamed(context, '/addNote'),
                  child: new Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: NotesColor.noteColor[600]),
                      child: Column(
                        children: <Widget>[
                          Padding(
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
                          ),
                          Expanded(
                            // width: MediaQuery.of(context).size.width - 10,
                            // height: MediaQuery.of(context).size.height - 10,
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                '''Add them. The assertion here will help remind us of that higher up in the call stack, since this assertion would otherwise fire somewhere in the framework Add them. The assertion here will help remind us of that higher up in the call stack, since this assertion would otherwise fire somewhere in the framework ,Add them. The assertion here will help remind us of that higher up in the call stack, since this assertion would otherwise fire somewhere in the framework''',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 5,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 5, bottom: 10),
                                child: Text("Hello"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 5, bottom: 10),
                                child: Text("${newFormat.format(today)}"),
                              ),
                            ],
                          )
                        ],
                      )),
                ),
                staggeredTileBuilder: (int index) {
                  return new StaggeredTile.count(2, index.isEven ? 2 : 3);
                },
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
              ),
            )
          ],
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
