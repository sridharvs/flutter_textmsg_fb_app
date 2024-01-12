import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_textmsg_fb_app/services/auth/login_or_register_page.dart';
import 'package:flutter_textmsg_fb_app/pages/home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //User is Logged in
          if (snapshot.hasData) {
            return HomePage();
          }
          //User is Not Logged in
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
