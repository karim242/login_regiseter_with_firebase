import 'package:flutter/material.dart';
import 'package:new_version_of_chat_app/screens/login_Page.dart';
import 'package:new_version_of_chat_app/screens/register_Page.dart';



void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginPage.id : (context) => const LoginPage(),
        RegisterPage.id : (context) => const RegisterPage(),
      },
      initialRoute: LoginPage.id
    );
  }
}

