import 'package:coronatestergebnis_app/features/home/presentation/widgets/info.card.dart';
import 'package:flutter/material.dart';

class InfoDisplay extends StatelessWidget {
  final Color cardColor;
  final List<InfoCardContent> infoCards;
  final String title;

  const InfoDisplay(
      {Key? key,
      required this.cardColor,
      required this.infoCards,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        )),
        Column(
          children: infoCards
              .map((c) => InfoCard(color: cardColor, content: c))
              .toList(),
        )
      ],
    );
  }
}
