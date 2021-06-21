import 'package:coronatestergebnis_app/features/authentication/presentation/pages/authentication.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/dependency.injector.dart';
import 'features/authentication/presentation/bloc/authentication_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AuthenticationBloc _authenticationBloc = injector<AuthenticationBloc>()
    ..add(AuthenticationInit());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _authenticationBloc,
<<<<<<< HEAD
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData.dark().copyWith(accentColor: Colors.white),
            home: BlocListener<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                if (state is AuthenticationInitial) {
                  Navigator.popUntil(context, (route) => route.isFirst);
                }
              },
              child: AuthenticationPage(), //AuthenticationPage();
            ),
          );
        },
=======
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: FutureBuilder(
          future: _initialization,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AuthenticationPage(); //AuthenticationPage();
            }
            return Container();
          },
        ),
>>>>>>> main
      ),
    );
  }
}

// https://firebase.flutter.dev/docs/overview/
