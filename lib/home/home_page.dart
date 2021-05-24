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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NoteCardWidget(
                notes: notes,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 120,
                      child: ElevatedButton.icon(
                          onPressed: () async {
                            var description = await Navigator.pushNamed(
                                context, '/create-note');
                            setState(() {
                              notes.add(description! as String);
                            });
                          },
                          icon: Icon(Icons.add),
                          label: Text('Nota')),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var description = await Navigator.pushNamed(context, '/create-note');
          setState(() {
            notes.add(description! as String);
          });
        },
        child: Icon(Icons.add),
      ),*/
    );
  }
}
