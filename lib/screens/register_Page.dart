// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:new_version_of_chat_app/widget/show_snackBar.dart';

import '../constant.dart';
import '../widget/custom_button.dart';
import '../widget/custom_textField.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});
  static String id = "RegisterPage";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
                      "Register",
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
                        await registerAuth();
                        showSnackBar(context, "Resgister Success ");
                        Navigator.pop(context);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnackBar(context, "Weak password");
                        } else if (e.code == 'email-already-in-use') {
                          showSnackBar(context,
                              'The account already exists for that email.');
                        }
                        isloading = false;
                        setState(() {});
                      }
                    }
                  },
                  text: "Register",
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        " Log In",
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

  Future<void> registerAuth() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
