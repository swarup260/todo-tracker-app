import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notes/flavours.dart';
import 'package:notes/models/note_list.dart';
import 'package:notes/models/note_provider.dart';
import 'package:notes/routes/add_note.dart';
import 'package:notes/services/note_services.dart';
import 'package:notes/widgets/note_tile.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class NoteslistWidget extends StatelessWidget {
  NoteslistWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(Provider.of<Flavours>(context));

    NoteServices _noteServices = NoteServices(Provider.of<Flavours>(context));
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
                    builder: (BuildContext context) => ChangeNotifierProvider<NoteProvider>(create: (_) => NoteProvider(snapshot.data.data[index]),child: AddNote()))),
                child: NoteTile(note: snapshot.data.data[index]),
              ),
              staggeredTileBuilder: (int index) {
                double height = 1.5;

                Note note = snapshot.data.data[index];

                if (note.body.length > 150) {
                  height = 1.8;
                }
                if (note.body.length > 200) {
                  height = 2;
                }
                if (note.body.length > 300) {
                  height = 2.2;
                }

                return new StaggeredTile.count(2, height);
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
