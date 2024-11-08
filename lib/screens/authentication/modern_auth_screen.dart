import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ModernAuthScreen extends StatefulWidget {
  const ModernAuthScreen({super.key});

  @override
  State<ModernAuthScreen> createState() => _ModernAuthScreenState();
}

class _ModernAuthScreenState extends State<ModernAuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isSignIn = true;
  bool _isLoading = false;
  bool _obscurePassword = true;
  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleEmailAuth() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      setState(() => _errorMessage = 'Please fill in all fields');
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      if (_isSignIn) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      } else {
        final userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'email': _emailController.text.trim(),
          'createdAt': FieldValue.serverTimestamp(),
          'isProfileComplete': false,
        });
      }
    } on FirebaseAuthException catch (e) {
      setState(() => _errorMessage = _getErrorMessage(e.code));
    } catch (e) {
      setState(() => _errorMessage = 'An unexpected error occurred');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _handleGoogleSignIn() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      if (userCredential.additionalUserInfo?.isNewUser ?? false) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'email': userCredential.user!.email,
          'createdAt': FieldValue.serverTimestamp(),
          'isProfileComplete': false,
        });
      }
    } catch (e) {
      setState(() => _errorMessage = 'Failed to sign in with Google');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  String _getErrorMessage(String code) {
    switch (code) {
      case 'user-not-found':
        return 'No user found with this email';
      case 'wrong-password':
        return 'Wrong password provided';
      case 'email-already-in-use':
        return 'An account already exists with this email';
      case 'invalid-email':
        return 'Please enter a valid email address';
      case 'weak-password':
        return 'The password provided is too weak';
      default:
        return 'An error occurred during authentication';
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: GestureDetector(
        onTap: () =>
            FocusScope.of(context).unfocus(), // Unfocus when tapping outside
        behavior: HitTestBehavior
            .translucent, // Ensures gesture detection works everywhere
        child: Container(
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
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 48.0)),
                    Text(
                      _isSignIn ? 'Welcome Back!' : 'Create Account',
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onSurface,
                              ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 32.0),
                      child: Text(
                        _isSignIn
                            ? 'Sign in to continue exploring parks'
                            : 'Join our community of park enthusiasts',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: colorScheme.primary),
                        prefixIcon: Icon(Icons.email_outlined,
                            color: colorScheme.primary),
                        filled: true,
                        fillColor: colorScheme.surface,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const Padding(padding: EdgeInsets.only(top: 16.0)),
                    TextField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(color: colorScheme.primary),
                        prefixIcon: Icon(Icons.lock_outline,
                            color: colorScheme.primary),
                        suffixIcon: _passwordController.text.isNotEmpty
                            ? IconButton(
                                icon: Icon(
                                  _obscurePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: colorScheme.primary,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscurePassword = !_obscurePassword;
                                  });
                                },
                              )
                            : null,
                        filled: true,
                        fillColor: colorScheme.surface,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      obscureText: _obscurePassword,
                      onChanged: (value) =>
                          setState(() {}), // Trigger rebuild when text changes
                    ),
                    if (_errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(
                          _errorMessage!,
                          style: TextStyle(color: colorScheme.error),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _handleEmailAuth,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colorScheme.primary,
                          foregroundColor: colorScheme.onPrimary,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: _isLoading
                            ? const CircularProgressIndicator()
                            : Text(_isSignIn ? 'Sign In' : 'Create Account'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: OutlinedButton(
                        onPressed: _isLoading ? null : _handleGoogleSignIn,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: colorScheme.primary,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          side: BorderSide(color: colorScheme.primary),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.login, color: colorScheme.primary),
                            const SizedBox(width: 8),
                            const Text('Continue with Google'),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: TextButton(
                        onPressed: _isLoading
                            ? null
                            : () => setState(() => _isSignIn = !_isSignIn),
                        child: Text(
                          _isSignIn
                              ? 'Don\'t have an account? Sign Up'
                              : 'Already have an account? Sign In',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
