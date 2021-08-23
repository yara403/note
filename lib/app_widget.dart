import 'package:flutter/material.dart';
import 'package:notes/error/error_page.dart';
import 'package:notes/login/login_page.dart';
import 'package:notes/note/create_note_page.dart';
import 'package:notes/home/home_page.dart';

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      title: 'Notes',
      initialRoute: "/login",
      routes: {
        "/home": (context) => HomePage(),
        "/create-note": (context) => CreateNotePage(),
        "/login": (context) => LoginPage(),
        "/error": (context) => ErrorPage(),
      },
    );
  }
}
