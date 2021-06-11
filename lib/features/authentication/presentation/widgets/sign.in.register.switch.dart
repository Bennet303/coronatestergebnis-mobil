import 'package:flutter/material.dart';

class SignInRegisterSwitch extends StatefulWidget {
  @override
  _SignInRegisterSwitchState createState() => _SignInRegisterSwitchState();
}

class _SignInRegisterSwitchState extends State<SignInRegisterSwitch> {
  bool firstOptionActive = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[600],
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) => Container(
              width: constraints.maxWidth * 0.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
          Positioned.fill(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Anmelden',
                  style: TextStyle(
                      color: firstOptionActive ? Colors.black : Colors.white),
                ),
                Text('Registrieren',
                    style: TextStyle(
                        color: firstOptionActive ? Colors.white : Colors.black))
              ],
            ),
          )
        ],
      ),
    );
  }
}
