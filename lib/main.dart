import 'package:flutter/material.dart';
import 'package:notes/flavours.dart';
import 'package:notes/routes/my_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Provider<Flavours>.value(value: Flavours.development, child: MyApp()));
}

