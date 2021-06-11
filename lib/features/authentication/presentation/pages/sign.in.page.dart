import 'package:coronatestergebnis_app/features/authentication/presentation/widgets/text.input.field.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 80),
              width: MediaQuery.of(context).size.width,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Anmelden.',
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Willkommen zurück!',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
            TextInputField(
              controller: _emailController,
              hint: 'Email',
            ),
            SizedBox(height: 20),
            TextInputField(
              controller: _passwordController,
              hint: 'Passwort',
            ),
          ],
        ),
      ],
    );
  }
}
