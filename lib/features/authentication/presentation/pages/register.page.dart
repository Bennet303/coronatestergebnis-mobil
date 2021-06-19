import 'package:coronatestergebnis_app/features/authentication/domain/entities/credentials.dart';
import 'package:coronatestergebnis_app/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:coronatestergebnis_app/features/authentication/presentation/widgets/primary.button.dart';
import 'package:coronatestergebnis_app/features/authentication/presentation/widgets/text.input.field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _passwordRepeatController =
      new TextEditingController();
  final TextEditingController _firstnameController =
      new TextEditingController();
  final TextEditingController _lastnameController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();

  static GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Column(
            //TODO: list view
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
                        'Registrieren.',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              ),
              TextInputField(
                onFieldSubmitted: (_) {
                  submit(context);
                },
                controller: _firstnameController,
                hint: 'Vorname',
              ),
              SizedBox(height: 20),
              TextInputField(
                onFieldSubmitted: (_) {
                  submit(context);
                },
                controller: _lastnameController,
                hint: 'Nachname',
              ),
              SizedBox(height: 20),
              TextInputField(
                onFieldSubmitted: (_) {
                  submit(context);
                },
                controller: _emailController,
                hint: 'Email',
              ),
              SizedBox(height: 20),
              TextInputField(
                onFieldSubmitted: (_) {
                  submit(context);
                },
                controller: _passwordController,
                hint: 'Passwort',
                obscureText: true,
                validator: (val) {
                  if (_passwordRepeatController.value.text != val) {
                    return "Die Passwörter stimmen nicht überein!";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextInputField(
                onFieldSubmitted: (_) {
                  submit(context);
                },
                controller: _passwordRepeatController,
                hint: 'Passwort wiederholen',
                obscureText: true,
                validator: (val) {
                  if (_passwordController.value.text != val) {
                    return "Die Passwörter stimmen nicht überein!";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 30,
              ),
              PrimaryButton(
                onPressed: () {
                  submit(context);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 50,
                  child: Center(
                    child: Text('Registrieren'),
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
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthenticationBloc>(context).add(
        AuthenticationRegister(
          credentials: Credentials(
            email: _emailController.value.text,
            password: _passwordController.value.text,
          ),
          firstname: _firstnameController.value.text,
          lastname: _lastnameController.value.text,
        ),
      );
    }
  }
}
