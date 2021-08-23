import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String message = ModalRoute.of(context)!.settings.arguments as String;
    return Material(
      child: Center(
        child: Text(message),
      ),
    );
  }
}
