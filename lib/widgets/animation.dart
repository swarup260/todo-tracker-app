import 'package:flutter/material.dart';
import 'package:notes/utils/notes_color.dart';

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
  Animation<double> animationRadius;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    animation = Tween<double>(begin: 10, end: 1300).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    // ..addStatusListener((status) {
    //   print('$status');
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse();
    //   }
    //   if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });

    /* Animation curveAnimation =
        CurvedAnimation(parent: controller, curve: Curves.bounceIn); */

    animationRadius = Tween<double>(begin: 100, end: 0).animate(controller);

    // controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Align(
        alignment: Alignment.bottomRight,
        child: Container(
            width: animation.value,
            height: animation.value,
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.cancel),
                onPressed: () => {controller.reverse()},
              ),
            ),
            // color: NotesColor.noteColor,
            decoration: BoxDecoration(
              color: NotesColor.noteColor[700],
              borderRadius: BorderRadius.circular(animationRadius.value),
            )),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add), onPressed: () => {controller.forward()}),
    );
  }
}
