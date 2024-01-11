import 'package:flutter/material.dart';
import 'package:flutter_textmsg_fb_app/auth/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  void logOut() {
    //get auth service
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        actions: [
          //logout button
          IconButton(
            onPressed: logOut,
            icon: Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
