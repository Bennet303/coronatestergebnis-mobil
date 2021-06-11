import 'package:coronatestergebnis_app/features/authentication/presentation/widgets/text.input.field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _passwordRepeatController =
      new TextEditingController();
  final TextEditingController _firstnameController =
      new TextEditingController();
  final TextEditingController _lastnameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          //TODO: list view
          children: [
            TextInputField(
              controller: _firstnameController,
              hint: 'Vorname',
            ),
            SizedBox(height: 20),
            TextInputField(
              controller: _lastnameController,
              hint: 'Nachname',
            ),
            SizedBox(height: 20),
            TextInputField(
              controller: _emailController,
              hint: 'Email',
            ),
            SizedBox(height: 20),
            TextInputField(
              controller: _passwordController,
              hint: 'Passwort',
            ),
            SizedBox(height: 20),
            TextInputField(
              controller: _passwordRepeatController,
              hint: 'Passwort wiederholen',
            )
          ],
        ),
      ],
    );
  }
}
