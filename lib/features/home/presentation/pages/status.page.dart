import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox.expand(
        child: SingleChildScrollView(
          controller: ModalScrollController.of(context),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                color: Colors.green,
                child: Stack(
                  children: [
                    Positioned(
                      width: 25,
                      height: 25,
                      top: 10,
                      right: MediaQuery.of(context).size.width * 0.08,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close),
                      ),
                    ),
                    Positioned.fill(
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Kein positives Testergebnis gemeldet',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.update),
                                Text(
                                  'Aktualisiert: Gerade eben',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.subtitle1,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1),
                child: Column(
                  children: [
                    ChildInfoCard(
                      name: 'Bennet Hölscher',
                      schoolClass: 'FS182',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChildInfoCard extends StatelessWidget {
  final String name;
  final String schoolClass;
  final Color? color;

  const ChildInfoCard({
    Key? key,
    required this.name,
    required this.schoolClass,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.8,
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
          child: DefaultTextStyle(
            style: Theme.of(context).textTheme.headline6!,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  name,
                ),
                Text(schoolClass),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
