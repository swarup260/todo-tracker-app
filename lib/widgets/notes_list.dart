import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:notes/flavours.dart';
import 'package:notes/models/note_list.dart';
import 'package:notes/routes/add_note.dart';
import 'package:notes/services/api_services.dart';
import 'package:notes/services/note_services.dart';
import 'package:notes/widgets/note_tile.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class NoteslistWidget extends StatelessWidget {
  NoteslistWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NoteServices _noteServices = NoteServices(
        flavours: Provider.of<Flavours>(context), apiServices: ApiServices());

    return FutureBuilder<NoteList>(
      future: _noteServices.fetchNotes(),
      // ignore: missing_return
      builder: (BuildContext context, AsyncSnapshot<NoteList> snapshot) {
        if (snapshot.hasData) {
          return Expanded(
            child: StaggeredGridView.countBuilder(
              padding: EdgeInsets.all(15),
              crossAxisCount: 4,
              itemCount: snapshot.data.data.length,
              itemBuilder: (BuildContext context, int index) => InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (BuildContext context) => AddNote(
                          note: snapshot.data.data[index],
                        ))),
                // child: Hero(
                //     tag: '${snapshot.data.data[index].id}',
                //     child: NoteTile(note: snapshot.data.data[index])),
                child: NoteTile(note: snapshot.data.data[index]),
              ),
              staggeredTileBuilder: (int index) {
                return new StaggeredTile.count(2, index.isEven ? 2 : 2.5);
              },
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
            ),
          );
        }

        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
