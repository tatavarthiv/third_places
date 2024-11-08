import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:parks/screens/authentication/email_verification_screen.dart';
import 'package:parks/screens/authentication/modern_auth_screen.dart';
import 'package:parks/screens/tabs.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Show auth screen if no user
        if (!snapshot.hasData) {
          return const ModernAuthScreen();
        }

        // Show verification screen if email isn't verified
        if (!snapshot.data!.emailVerified) {
          return const EmailVerificationScreen();
        }

        // Show main app if email is verified
        return const TabsScreen();
      },
    );
  }
}
