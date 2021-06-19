import 'package:coronatestergebnis_app/features/authentication/presentation/widgets/primary.button.dart';
import 'package:coronatestergebnis_app/features/authentication/presentation/widgets/text.input.field.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class JoinClassPage extends StatelessWidget {
  static GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _firstnameController =
      new TextEditingController();
  final TextEditingController _lastnameController = new TextEditingController();

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
                          'Einschreiben in die Klasse FS182',
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
                      PrimaryButton(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 50,
                          child: Center(
                            child: Text('Einschreiben'),
                          ),
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
