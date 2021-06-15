import 'package:coronatestergebnis_app/features/home/presentation/widgets/clickable.indicator.dart';
import 'package:flutter/material.dart';

class StatusPanel extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final String text;

  const StatusPanel(
      {Key? key,
      required this.onPressed,
      required this.color,
      required this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.8,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(color),
        ),
        onPressed: onPressed,
        child: Stack(
          children: [
            Positioned(
              right: MediaQuery.of(context).size.width * 0.05,
              top: MediaQuery.of(context).size.width * 0.05,
              child: SizedBox(
                width: 25,
                height: 25,
                child: ClickableIndicator(
                  color: color,
                ),
              ),
            ),
            Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
