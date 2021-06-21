import 'package:coronatestergebnis_app/core/dependency.injector.dart';
import 'package:coronatestergebnis_app/features/authentication/presentation/widgets/primary.button.dart';
import 'package:coronatestergebnis_app/features/authentication/presentation/widgets/text.input.field.dart';
import 'package:coronatestergebnis_app/features/qr_scan/domain/entities/qr.code.dart';
import 'package:coronatestergebnis_app/features/qr_scan/presentation/bloc/join.class_bloc/join.class_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class JoinClassPage extends StatelessWidget {
  static GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final QrCode qrCode;

  final TextEditingController _firstnameController =
      new TextEditingController();
  final TextEditingController _lastnameController = new TextEditingController();

  JoinClassPage({Key? key, required this.qrCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<JoinClassBloc>(
      create: (context) => injector<JoinClassBloc>(),
      child: BlocListener<JoinClassBloc, JoinClassState>(
        listener: (context, state) {
          if (state is JoinClassFailed || state is JoinClassSuccessful) {
            bool joinFailed = state is JoinClassFailed;
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(joinFailed ? 'Fehlgeschlagen' : 'Erfolgreich'),
                  content: Text(
                    joinFailed
                        ? 'Die Angaben zum Schüler stimmen nicht mit denen überein, die bei der Erstellung des QR-Codes hinterlegt wurde.'
                        : 'Der Schüler wurde erfolgreich zur Klasse hinzugefügt. Zukünftig erhalten sie Informationen zum Teststatus der Klasse.',
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          if (joinFailed) {
                            Navigator.of(context).pop();
                          } else {
                            int count = 0;
                            Navigator.of(context).popUntil((_) => count++ >= 2);
                          }
                        },
                        child: Text('OK'))
                  ],
                );
              },
            );
          }
        },
        child: Material(
          child: SizedBox.expand(
            child: SingleChildScrollView(
              controller: ModalScrollController.of(context),
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    color: Colors.green,
                    margin: EdgeInsets.only(bottom: 60),
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
                          child: Center(
                            child: Text(
                              "Einschreiben in die, Klasse ${qrCode.classID}",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1,
                      ),
                      child: Column(
                        children: [
                          TextInputField(
                              onFieldSubmitted: (_) {},
                              controller: _firstnameController,
                              hint: 'Vorname des Schülers'),
                          SizedBox(height: 20),
                          TextInputField(
                              onFieldSubmitted: (_) {},
                              controller: _lastnameController,
                              hint: 'Nachname des Schülers'),
                          SizedBox(height: 30),
                          Builder(
                            builder: (context) {
                              return PrimaryButton(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height: 50,
                                  child: Center(
                                    child: Text('Einschreiben'),
                                  ),
                                ),
                                onPressed: () {
                                  BlocProvider.of<JoinClassBloc>(context).add(
                                    JoinClass(
                                      qrCode: qrCode,
                                      inputFirstname:
                                          _firstnameController.value.text,
                                      inputLastname:
                                          _lastnameController.value.text,
                                    ),
                                  );
                                },
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
