import 'package:flutter/material.dart';

class LoginePage extends StatefulWidget {
  const LoginePage({super.key});

  @override
  State<LoginePage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Home")),
        body: Container(
          child: Row(
            children: const [
              Image(
                image: AssetImage('images/login.png'),
                height: 200,
                fit: BoxFit.fill,
              )
            ],
          ),
        ));
  }
}
