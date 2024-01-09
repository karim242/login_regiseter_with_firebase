import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
   CustomButton({super.key,this.onTap, required this.text});
  VoidCallback? onTap;
 final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color:  Color(0xff2B475E), fontSize: 24),
          ),
        ),
      ),
    );
  }
}
