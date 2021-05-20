import 'package:flutter/material.dart';
import 'package:notes/note/create_note_page.dart';
import 'package:notes/home/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      title: 'Notes',
      initialRoute: "/home",
      routes: {
        "/home": (context) => HomePage(),
        "/create-note": (context) => CreateNotePage(),
      },
    );
  }
}
