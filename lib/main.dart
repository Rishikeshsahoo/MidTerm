import 'dart:ui';
import 'package:cricket/bmi.dart';
import 'package:cricket/cricket_screen.dart';
import 'package:cricket/dash_board.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DashBoard(),
    );
  }
}
