import 'package:coronatestergebnis_app/core/dependency.injector.dart';
import 'package:coronatestergebnis_app/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:coronatestergebnis_app/features/home/domain/entities/test.result.dart';
import 'package:coronatestergebnis_app/features/home/presentation/bloc/test.result_bloc.dart';
import 'package:coronatestergebnis_app/features/home/presentation/pages/status.page.dart';
import 'package:coronatestergebnis_app/features/home/presentation/widgets/info.card.dart';
import 'package:coronatestergebnis_app/features/home/presentation/widgets/info.display.dart';
import 'package:coronatestergebnis_app/features/home/presentation/widgets/status.panel.dart';
import 'package:coronatestergebnis_app/features/home/presentation/widgets/tab.navigation.bar.dart';
import 'package:coronatestergebnis_app/features/qr_scan/presentation/pages/qr.scan.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;
  List<Widget> pages = [
    HomeStatusPage(),
    QrScanPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: TabNavigationBar(
          currentIndex: selectedPage,
          onTap: (index) {
            setState(() {
              selectedPage = index;
            });
          },
        ),
        body: pages[selectedPage],
      ),
    );
  }
}

class HomeStatusPage extends StatelessWidget {
  const HomeStatusPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TestResultBloc>(
      create: (context) => injector<TestResultBloc>()..add(GetTestResult()),
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (!(state is UserSignedIn)) throw Exception('Not authenitcated!');
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
                vertical: 20,
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 60, bottom: 50),
                    width: MediaQuery.of(context).size.width,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Hallo, ${state.user.firstname}!",
                          style:
                              Theme.of(context).textTheme.headline4!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                  ),
                  BlocBuilder<TestResultBloc, TestResultState>(
                      builder: (context, testResultState) {
                    bool testIsPositive = false;
                    if (testResultState is TestResultLoaded) {
                      testIsPositive =
                          testResultState.testResult is PositiveTestResult;
                    }
                    return StatusPanel(
                      text: testIsPositive
                          ? 'Positives Testergebnis gemeldet!'
                          : 'Kein positives Testergebnis gemeldet!',
                      color: testIsPositive ? Colors.red : Colors.green,
                      onPressed: () {
                        showCupertinoModalBottomSheet(
                          context: context,
                          builder: (context) => StatusPage(
                            testResultState: testResultState,
                          ),
                          isDismissible: true,
                        );
                      },
                    );
                  }),
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
          );
        },
      ),
    );
  }
}
