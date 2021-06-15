import 'package:flutter/material.dart';

class ClickableIndicator extends StatelessWidget {
  final Color color;

  const ClickableIndicator({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Center(
        child: Icon(
          Icons.chevron_right,
          color: color,
        ),
      ),
    );
  }
}
