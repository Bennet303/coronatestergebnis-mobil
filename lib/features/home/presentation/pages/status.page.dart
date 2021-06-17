import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coronatestergebnis_app/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:coronatestergebnis_app/features/home/domain/entities/child.dart';
import 'package:coronatestergebnis_app/features/home/domain/entities/test.result.dart';
import 'package:coronatestergebnis_app/features/home/presentation/bloc/test.result_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class StatusPage extends StatelessWidget {
  final TestResultState testResultState;

  const StatusPage({Key? key, required this.testResultState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool testIsPositive = false;
    bool isLoading = true;
    if (testResultState is TestResultLoaded) {
      testIsPositive = (testResultState as TestResultLoaded).testResult
          is PositiveTestResult;
      isLoading = false;
    }
    return Material(
      child: SizedBox.expand(
        child: SingleChildScrollView(
          controller: ModalScrollController.of(context),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                color: testIsPositive ? Colors.red : Colors.green,
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
                            Text(
                                testIsPositive
                                    ? 'Positives Testergebnis gemeldet!'
                                    : 'Kein positives Testergebnis gemeldet!',
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.update),
                                Text(
                                  isLoading
                                      ? 'Lädt...'
                                      : "Aktualisiert: ${getLastUpdated((testResultState as TestResultLoaded).testResult.timestamp)}",
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
                  children: getChildInfoCards(context, testResultState),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  List<ChildInfoCard> getChildInfoCards(
      BuildContext context, TestResultState state) {
    AuthenticationState authState =
        BlocProvider.of<AuthenticationBloc>(context).state;

    TestResultState testState = state;

    TestResult testResult = testState is TestResultLoaded
        ? testState.testResult
        : NegativeTestResult(Timestamp.now());

    if (!(authState is UserSignedIn)) {
      throw Exception('User is not signed in');
    }

    List<ChildInfoCard> cards = authState.user.childs
        .map((c) => ChildInfoCard(
              child: c,
              color: testResult is PositiveTestResult
                  ? (testResult.affectedChilds.contains(c) ? Colors.red : null)
                  : null,
            ))
        .toList();

    return cards;
  }

  String getLastUpdated(Timestamp timestamp) {
    final now = DateTime.parse(Timestamp.now().toDate().toString());
    final created = DateTime.parse(timestamp.toDate().toString());
    final diff = now.difference(created);
    if (diff.inDays == 1) {
      return 'Gestern';
    } else if (diff.inDays >= 2) {
      return "Vor ${diff.inDays} Tagen";
    } else if (diff.inHours == 1) {
      return "Vor einer Stunde";
    } else if (diff.inHours >= 2) {
      return "Vor ${diff.inHours} Stunden";
    } else if (diff.inMinutes >= 2) {
      return "Vor ${diff.inMinutes} Minuten";
    } else {
      return "Gerade eben";
    }
  }
}

class ChildInfoCard extends StatelessWidget {
  final Child child;
  final Color? color;

  const ChildInfoCard({
    Key? key,
    required this.child,
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
                  child.firstname + " " + child.lastname,
                ),
                Text(child.classID),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
