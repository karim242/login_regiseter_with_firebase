
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({super.key,this.onChange, this.hintText});
final String? hintText;
Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      validator: (value){
        if (value!.isEmpty) {
          return "This field cannot be empty";
      }
      },
      onChanged:onChange,
      decoration:  InputDecoration(
        hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.white
          ),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.white
              )
          ),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.blue
              )
          )
      ),
    );
  }
}
