import 'package:clean_architecture_project/features/authentication/presentation/bloc/user_bloc.dart';
import 'package:clean_architecture_project/features/authentication/presentation/bloc/user_event.dart';
import 'package:clean_architecture_project/injection_container.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late UserBloc userBloc;
  late TextEditingController email;
  late TextEditingController password;
  late FocusNode emailFN;
  late FocusNode passwordFN;

  @override
  void initState() {
    super.initState();
    userBloc = sl<UserBloc>();
    email = TextEditingController();
    password = TextEditingController();
    emailFN = FocusNode();
    passwordFN = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
              ),
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: 70,
                decoration: BoxDecoration(),
                child: EditableText(
                  controller: email,
                  focusNode: emailFN,
                  style: TextStyle(),
                  cursorColor: Colors.black,
                  backgroundCursorColor: Colors.transparent,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
              ),
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: 70,
                decoration: BoxDecoration(),
                child: EditableText(
                  obscureText: true,
                  controller: password,
                  focusNode: passwordFN,
                  style: TextStyle(),
                  cursorColor: Colors.black,
                  backgroundCursorColor: Colors.transparent,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                userBloc.add(LoginEvent(
                  email: email.text,
                  password: password.text,
                ));
              },
              child: const Text("Connexion"),
            ),
          ],
        ),
      ),
    );
  }
}
