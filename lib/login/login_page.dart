import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes/login/login_controller.dart';
import 'package:notes/login/login_state.dart';
import 'package:notes/login/widget/login_button.dart';
import 'package:notes/theme/app_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController controller;

  @override
  initState() {
    controller = LoginController(onUpdate: () {
      if (controller.state is LoginStateSuccess)
        Navigator.pushReplacementNamed(context, '/home',
            arguments: (controller.state as LoginStateSuccess).user);
      else
        setState(() {});
    });
    initializeFlutterFire();
    super.initState();
  }

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      await Future.delayed(Duration(seconds: 2));
      //VAI PARA A TELA DE LOGIN
    } on Exception catch (e) {
      Navigator.pushNamed(context, "/error",
          arguments: 'Erro de inicialização Firebase: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes - Login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 210,
              height: 52,
              child: ListTile(
                leading: Image.asset(
                  'assets/images/emoji.png',
                  width: 50,
                  height: 50,
                ),
                title: Text(
                  'Faça seu login',
                  style: AppTheme.text.primary,
                ),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            if (controller.state is LoginStateLoading) ...[
              Center(
                child: CircularProgressIndicator(),
              )
            ] else if (controller.state is LoginStateFailure) ...[
              Center(
                  child: Text((controller.state as LoginStateFailure).message))
            ] else
              LoginButtonWidget(
                imageUrl: 'assets/images/google.png',
                label: 'Entrar com Google',
                onTap: controller.googleSignIn,
              ),
            SizedBox(
              height: 8,
            ),
            LoginButtonWidget(
              imageUrl: 'assets/images/apple.png',
              label: 'Entrar com Apple',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
