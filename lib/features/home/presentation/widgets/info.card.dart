import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final Color color;
  final InfoCardContent content;

  const InfoCard({Key? key, required this.color, required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      color: color,
      child: Container(
        constraints: BoxConstraints(minHeight: 100),
        padding: EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                content.headline,
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              content.body,
              softWrap: true,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCardContent {
  final String headline;
  final String body;

  InfoCardContent({required this.headline, required this.body});
}
