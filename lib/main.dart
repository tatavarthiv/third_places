import 'package:flutter/material.dart';
import 'package:parks/screens/tabs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  // initialize Firebase within Flutter app
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const MaterialApp(
      home: TabsScreen(),
    ),
  );
}
