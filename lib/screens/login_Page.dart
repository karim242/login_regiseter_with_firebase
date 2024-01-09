import 'package:flutter/material.dart';
import 'package:new_version_of_chat_app/screens/register_Page.dart';

import '../constant.dart';
import '../widget/custom_button.dart';
import '../widget/custom_textField.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static String id = "LoginPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
              hintText: "Email",
            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextField(
              hintText: "Password",
            ),
            const SizedBox(
              height: 12,
            ),
            CustomButton(
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
    );
  }
}
