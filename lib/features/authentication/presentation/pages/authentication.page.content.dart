import 'package:coronatestergebnis_app/features/authentication/presentation/pages/register.page.dart';
import 'package:coronatestergebnis_app/features/authentication/presentation/pages/sign.in.page.dart';
import 'package:coronatestergebnis_app/features/authentication/presentation/widgets/text.input.field.dart';
import 'package:flutter/material.dart';

class AuthenticationPageContent extends StatefulWidget {
  @override
  State<AuthenticationPageContent> createState() =>
      _AuthenticationPageContentState();
}

class _AuthenticationPageContentState extends State<AuthenticationPageContent> {
  PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1,
          ),
          child: SignInPage(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1,
          ),
          child: RegisterPage(),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
