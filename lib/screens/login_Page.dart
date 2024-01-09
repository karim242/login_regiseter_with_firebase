// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:new_version_of_chat_app/screens/register_Page.dart';
import 'package:new_version_of_chat_app/widget/show_snackBar.dart';

import '../constant.dart';
import '../widget/custom_button.dart';
import '../widget/custom_textField.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  static String id = "LoginPage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey();

  bool isloading = false;

  String? email;

  String? password;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const Image(
                  image: AssetImage("assets/images/scholar.png"),
                  height: 150,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Scholar Chat ",
                      style: TextStyle(
                        fontFamily: "Pacifico",
                        color: Colors.white,
                        fontSize: 32,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Text(
                      "Log In",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomTextField(
                  onChange: (value) {
                    email = value;
                  },
                  hintText: "Email",
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  onChange: (value) {
                    password = value;
                  },
                  hintText: "Password",
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isloading = true;
                      setState(() {});
                      try {
                        await loginAuth();
                        showSnackBar(context, "Login Success ");
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showSnackBar(context,
                              "No user found for that email.Register Now");
                        } else if (e.code == 'wrong-password') {
                          showSnackBar(
                              context, 'Wrong password provided for that user..');
                        }
                        isloading = false;
                         setState(() {});
                      }
                    }
                  },
                  text: "Log In",
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  children: [
                    const Text(
                      "don't have an account?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterPage.id);
                      },
                      child: const Text(
                        " Sing Up",
                        style: TextStyle(
                          color: Color(0xffC7EDE6),
                          fontSize: 18,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginAuth() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
