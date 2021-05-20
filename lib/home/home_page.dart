import 'package:flutter/material.dart';
import 'package:notes/home/widget/note_card_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notes = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NOTES'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: NoteCardWidget(
          notes: notes,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var description = await Navigator.pushNamed(context, '/create-note');
          setState(() {
            notes.add(description! as String);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
