import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AnimationPage extends StatefulWidget {
  String title;
  AnimationPage({Key key, this.title}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text(widget.title),),
    );
  }
}
