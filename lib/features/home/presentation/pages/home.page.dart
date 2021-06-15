import 'package:coronatestergebnis_app/features/home/presentation/widgets/info.card.dart';
import 'package:coronatestergebnis_app/features/home/presentation/widgets/info.display.dart';
import 'package:coronatestergebnis_app/features/home/presentation/widgets/status.panel.dart';
import 'package:coronatestergebnis_app/features/home/presentation/widgets/tab.navigation.bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: TabNavigationBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.1,
              vertical: 20,
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 60, bottom: 80),
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Hallo Vorname!',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                StatusPanel(
                  text: 'Kein positives Testergebnis gemeldet!',
                  color: Colors.green,
                  onPressed: () {},
                ),
                SizedBox(
                  height: 50,
                ),
                InfoDisplay(
                  cardColor: Theme.of(context).cardColor,
                  title: 'Vorgehen bei einem positivem Testergebnis?',
                  infoCards: [
                    InfoCardContent(
                      headline: '1. Lassen Sie Ihr Kind testen',
                      body:
                          'Sorgen Sie dafür, dass ihr Kind unverzüglich mittels eines PCR-Tests auf COVID-19 getestet wird.',
                    ),
                    InfoCardContent(
                      headline: '2. Ergebnis melden',
                      body:
                          'Geben Sie das Ergebnis des PCR-Tests nach Erhalt an den Klassenlehrer weiter.',
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
