import 'package:flutter/material.dart';
import 'package:notes/home/widget/home_app_bar.dart';
import 'package:notes/home/widget/note_card_widget.dart';
import 'package:notes/login/models/user_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notes = <String>[];

  @override
  Widget build(BuildContext context) {
    UserModel user = ModalRoute.of(context)!.settings.arguments as UserModel;
    return Scaffold(
      appBar: HomeAppBarWidget(
        user: user,
        onTap: () async {
          var description = await Navigator.pushNamed(context, '/create-note');
          setState(() {
            notes.add(description! as String);
          });
        },
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
            ],
          ),
        ),
      ),
    );
  }
}
