import 'package:coronatestergebnis_app/features/authentication/presentation/bloc/authentication.page_bloc/authentication_page_bloc.dart';
import 'package:coronatestergebnis_app/features/authentication/presentation/pages/authentication.page.content.dart';
import 'package:coronatestergebnis_app/features/authentication/presentation/widgets/sign.in.register.switch.dart';
import 'package:coronatestergebnis_app/features/home/presentation/pages/home.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/authentication_bloc.dart';

class AuthenticationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationPageBloc(),
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if (state is UserSignedIn) {
            final route = MaterialPageRoute(
              builder: (context) => HomePage(),
            );
            Navigator.push(
              context,
              route,
            );
            // Navigator.removeRoute(context, route);
          }
        },
        child: Scaffold(
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
        ),
      ),
    );
  }
}
