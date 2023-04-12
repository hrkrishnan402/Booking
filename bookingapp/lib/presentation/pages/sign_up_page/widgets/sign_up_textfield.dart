import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpTextField extends StatelessWidget {
  const SignUpTextField(
      {super.key, this.controller, this.hintText, this.validator});

  final TextEditingController? controller;
  final String? hintText;
  final String Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: validator,
        decoration: InputDecoration(
            hintText: hintText,
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0.0),
            )
            ,
            disabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0.0),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0.0),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0.0),
            )));
  }
}
