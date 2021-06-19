import 'package:coronatestergebnis_app/features/authentication/presentation/pages/authentication.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/dependency.injector.dart';
import 'features/authentication/presentation/bloc/authentication_bloc.dart';
import 'features/authentication/presentation/pages/sign.in.page.dart';
import 'features/home/presentation/pages/home.page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final AuthenticationBloc _authenticationBloc = injector<AuthenticationBloc>()
    ..add(AuthenticationInit());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _authenticationBloc,
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData.dark(),
            home: BlocListener<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                if (state is AuthenticationInitial) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AuthenticationPage()),
                    (Route<dynamic> route) => false,
                  );
                }
              },
              child: FutureBuilder(
                future: _initialization,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AuthenticationPage(); //AuthenticationPage();
                  }
                  return Container();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

// https://firebase.flutter.dev/docs/overview/
