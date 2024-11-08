import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'package:parks/assets/authentication/auth_gate.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;

  @override
  void initState() {
    super.initState();

    // User needs to be created & verification email sent before checking
    isEmailVerified = FirebaseAuth.instance.currentUser?.emailVerified ?? false;

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        const Duration(seconds: 1),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> checkEmailVerified() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    // Force refresh the user
    await user.reload();

    // Get fresh user data
    final refreshedUser = FirebaseAuth.instance.currentUser;

    if (refreshedUser?.emailVerified ?? false) {
      setState(() => isEmailVerified = true);
      timer?.cancel();

      if (mounted) {
        // Navigate back to AuthGate to trigger a rebuild
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => const AuthGate(),
          ),
          (route) => false, // Remove all previous routes
        );
      }
    }
  }

  Future<void> sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() => canResendEmail = false);
      await Future.delayed(const Duration(seconds: 30));
      setState(() => canResendEmail = true);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              colorScheme.primaryContainer,
              colorScheme.surface,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.mark_email_unread_outlined,
                  size: 100,
                ),
                const SizedBox(height: 24),
                Text(
                  'Verify your email',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 24),
                Text(
                  'We\'ve sent a verification email to ${FirebaseAuth.instance.currentUser?.email}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                ),
                const SizedBox(height: 24),
                if (!isEmailVerified)
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(Icons.email),
                    label: const Text('Resend Email'),
                    onPressed: canResendEmail ? sendVerificationEmail : null,
                  ),
                const SizedBox(height: 16),
                TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: const Text('Cancel'),
                  onPressed: () => FirebaseAuth.instance.signOut(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
