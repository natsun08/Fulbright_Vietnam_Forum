//Main coder: Chi
import 'package:Fulbright_Vietnam_Forum/NaviBar.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'theme.dart';
import 'package:go_router/go_router.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen({super.key});

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Oops there's something wrong.\nPlease go back to the homepage",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
          ),
          Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
          Center(
            child: ElevatedButton(
              onPressed: () => context.go("/"),
              child: const Text("Go to home page"),
            ),
          )
        ],
      ),
    );
  }
}
