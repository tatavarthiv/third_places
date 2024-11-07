// import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
// import 'package:firebase_ui_auth/firebase_ui_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:parks/screens/tabs.dart';

// class AuthGate extends StatelessWidget {
//   const AuthGate({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return SignInScreen(
//             providers: [
//               EmailAuthProvider(),
//             ],
//             subtitleBuilder: (context, action) {
//               return Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 8.0),
//                 child: action == AuthAction.signIn
//                     ? const Text('Welcome to Third Places, please sign in!')
//                     : const Text('Welcome to Third Places, please sign up!'),
//               );
//             },
//             footerBuilder: (context, action) {
//               return const Padding(
//                 padding: EdgeInsets.only(top: 16),
//                 child: Text(
//                   'By signing in, you agree to our terms and conditions.',
//                   style: TextStyle(color: Colors.grey),
//                 ),
//               );
//             },
//           );
//         }

//         return const TabsScreen();
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:parks/screens/authentication/modern_auth_screen.dart';
import 'package:parks/screens/tabs.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const ModernAuthScreen();
        }
        return const TabsScreen();
      },
    );
  }
}
