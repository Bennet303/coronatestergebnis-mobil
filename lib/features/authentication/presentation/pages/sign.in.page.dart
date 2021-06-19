import 'package:coronatestergebnis_app/features/authentication/presentation/widgets/primary.button.dart';
import 'package:coronatestergebnis_app/features/authentication/presentation/widgets/text.input.field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/credentials.dart';
import '../bloc/authentication_bloc.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();

  static GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
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
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Willkommen zurück!',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ),
              TextInputField(
                onFieldSubmitted: (_) {
                  submit(context);
                },
                controller: _emailController,
                hint: 'Email',
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Bitte geben Sie Ihre Email ein";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextInputField(
                onFieldSubmitted: (_) {
                  submit(context);
                },
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Bitte geben Sie Ihr Passwort ein";
                  }
                  return null;
                },
                controller: _passwordController,
                hint: 'Passwort',
                obscureText: true,
              ),
              SizedBox(height: 30),
              PrimaryButton(
                onPressed: () {
                  submit(context);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 50,
                  child: Center(
                    child: Text('Anmelden'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void submit(BuildContext context) {
    if (_formKey.currentState!.validate())
      BlocProvider.of<AuthenticationBloc>(context).add(
        AuthenticationSignIn(
          Credentials(
            email: _emailController.value.text,
            password: _passwordController.value.text,
          ),
        ),
      );
  }
}
