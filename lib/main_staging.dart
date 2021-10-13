import 'package:flutter/material.dart';
import 'package:notes/flavours.dart';
import 'package:notes/widgets/my_app.dart';
import 'package:provider/provider.dart';

// flutter build --flavor development -t lib/main_staging.dart
void main() {
  runApp(Provider<Flavours>.value(value: Flavours.staging, child: MyApp()));
}
