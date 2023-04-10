import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpTextField extends StatelessWidget {
  const SignUpTextField({super.key, this.controller, this.hintText});

  final TextEditingController? controller;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
            hintText: hintText,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0.0),
            )));
  }
}
