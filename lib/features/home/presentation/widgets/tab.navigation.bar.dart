import 'package:flutter/material.dart';

class TabNavigationBar extends StatelessWidget {
  const TabNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      enableFeedback: false,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.qr_code), label: 'Klasseneinschreibung'),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menü'),
      ],
    );
  }
}
