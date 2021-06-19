import 'package:flutter/material.dart';

class TabNavigationBar extends StatelessWidget {
  final void Function(int) onTap;
  final int currentIndex;
  const TabNavigationBar({
    Key? key,
    required this.onTap,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: currentIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      //enableFeedback: false,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.qr_code), label: 'Klasseneinschreibung'),
        BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app), label: 'Abmelden'),
      ],
    );
  }
}
