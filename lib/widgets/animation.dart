import 'package:flutter/material.dart';
import 'package:notes/utils/notes_color.dart';
/* 
https://www.npmjs.com/package/commander
https://www.npmjs.com/package/treeify
https://www.npmjs.com/package/chalk
https://www.npmjs.com/package/inquirer
https://github.com/jondot/hygen

 */

// ignore: must_be_immutable
class AnimationPage extends StatefulWidget {
  String title;
  AnimationPage({Key key, this.title}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    animation = Tween<double>(begin: 10, end: 1300).animate(controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Hero(
            tag: 'add-new-todo',
            child: Container(
              width: 300,
              height: 300,
              color: NotesColor.noteColor[100],
            )),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), onPressed: () => {_gotoAddToDo(context)}),
    );
  }

  void _gotoAddToDo(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (BuildContext context) => Scaffold(
              appBar: AppBar(
                title: Text('Add ToDo'),
              ),
              body: Center(
                child: Hero(
                    tag: 'add-new-todo',
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                          color: NotesColor.noteColor[100],
                          borderRadius: BorderRadius.circular(100)),
                    )),
              ),
            )));
  }
}
