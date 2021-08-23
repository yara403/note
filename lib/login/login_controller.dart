import 'package:flutter/scheduler.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notes/login/login_state.dart';
import 'package:notes/login/models/user_model.dart';

class LoginController {
  LoginState state = LoginStateEmpty();
  final VoidCallback onUpdate;

  LoginController({required this.onUpdate});

  Future<void> googleSignIn() async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      state = LoginStateLoading();
      onUpdate();
      var account = await _googleSignIn.signIn();
      state = LoginStateSuccess(user: UserModel.google(account!));
      onUpdate();
    } on Exception catch (e) {
      state = LoginStateFailure(message: e.toString());
      onUpdate();
    }
  }
}
