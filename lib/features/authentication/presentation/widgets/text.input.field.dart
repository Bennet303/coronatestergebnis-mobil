import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  const TextInputField({Key? key, required this.controller, required this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: EdgeInsets.all(20),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(18.0))),
      ),
    );
  }
}
