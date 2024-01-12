import 'package:flutter/material.dart';
import 'package:flutter_textmsg_fb_app/services/auth/auth_gate.dart';
import 'package:flutter_textmsg_fb_app/firebase_options.dart';
import 'package:flutter_textmsg_fb_app/themes/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: const AuthGate(),
    );
  }
}
