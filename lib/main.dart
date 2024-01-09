import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_version_of_chat_app/firebase_options.dart';
import 'package:new_version_of_chat_app/screens/login_Page.dart';
import 'package:new_version_of_chat_app/screens/register_Page.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          LoginPage.id: (context) =>  LoginPage(),
          RegisterPage.id: (context) =>  RegisterPage(),
        },
        initialRoute: LoginPage.id);
  }
}
