
import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
   customButton({required this.text});
String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color:  Color(0xff2B475E),
              fontSize: 24
          ),
        ),
      ),
    );
  }
}
