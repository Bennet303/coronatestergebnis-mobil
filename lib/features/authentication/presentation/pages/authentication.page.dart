import 'package:coronatestergebnis_app/features/authentication/presentation/pages/authentication.page.content.dart';
import 'package:coronatestergebnis_app/features/authentication/presentation/widgets/sign.in.register.switch.dart';
import 'package:flutter/material.dart';

class AuthenticationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 60),
        child: Stack(
          children: [
            Positioned.fill(child: AuthenticationPageContent()),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1,
                ),
                child: SignInRegisterSwitch(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
