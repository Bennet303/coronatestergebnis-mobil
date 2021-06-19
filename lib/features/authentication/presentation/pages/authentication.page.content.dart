import 'package:coronatestergebnis_app/features/authentication/presentation/pages/register.page.dart';
import 'package:coronatestergebnis_app/features/authentication/presentation/pages/sign.in.page.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class AuthenticationPageContent extends StatefulWidget {
  @override
  State<AuthenticationPageContent> createState() =>
      _AuthenticationPageContentState();
}

class _AuthenticationPageContentState extends State<AuthenticationPageContent> {
  PageController _pageController = PageController(initialPage: 0);
  final _currentPageNotifier = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          onPageChanged: (int index) {
            _currentPageNotifier.value = index;
          },
          controller: _pageController,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                    vertical: 60),
                child: SignInPage(),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                    vertical: 60),
                child: RegisterPage(),
              ),
            ),
          ],
        ),
        Positioned(
          left: 0.0,
          bottom: 0.0,
          right: 0.0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CirclePageIndicator(
              currentPageNotifier: _currentPageNotifier,
              itemCount: 2,
            ),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
