import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

class SignInRegisterSwitch extends StatefulWidget {
  @override
  _SignInRegisterSwitchState createState() => _SignInRegisterSwitchState();
}

class _SignInRegisterSwitchState extends State<SignInRegisterSwitch> {
  bool firstOptionActive = true;

  @override
  Widget build(BuildContext context) {
    return Container();
    // FlutterToggleTab(
    //     width: 80,
    //     borderRadius: 18,
    //     selectedLabelIndex: (i) {},
    //     initialIndex: _stateToIndex(state),
    //     unSelectedTextStyle: TextStyle(color: Colors.black),
    //     selectedTextStyle: TextStyle(color: Colors.white),
    //     labels: ["Anmelden", "Registrieren"],
    //   );
  }
}

// Container(
//       height: 60,
//       child: Stack(
//         children: [
//           GestureDetector(
//             onTap: () {
//               BlocProvider.of<AuthenticationPageBloc>(context)
//                   .add(AuthenticationSignInSelected());
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.grey[600],
//                 borderRadius: BorderRadius.circular(18),
//               ),
//             ),
//           ),
//           LayoutBuilder(
//             builder: (context, constraints) => Container(
//               width: constraints.maxWidth * 0.5,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(18),
//               ),
//             ),
//           ),
//           Positioned.fill(
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Text(
//                   'Anmelden',
//                   style: TextStyle(
//                       color: firstOptionActive ? Colors.black : Colors.white),
//                 ),
//                 Text('Registrieren',
//                     style: TextStyle(
//                         color: firstOptionActive ? Colors.white : Colors.black))
//               ],
//             ),
//           )
//         ],
//       ),
//     );
