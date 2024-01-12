import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_textmsg_fb_app/components/user_tile.dart';
import 'package:flutter_textmsg_fb_app/pages/chat_page.dart';
import 'package:flutter_textmsg_fb_app/services/auth/auth_service.dart';
import 'package:flutter_textmsg_fb_app/components/my_drawer.dart';
import 'package:flutter_textmsg_fb_app/services/chat/chat_service.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

//chat & auth service
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }

//build a list of users except for the current logged in user
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        //error
        if (snapshot.hasError) {
          return const Text("Error");
        }
        //if loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }
        //return List view
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  //build individual list tile for user
  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    //display all users except current user
    if (userData["email"] != _authService.getCurrentuser()!.email) {
      return UserTile(
        text: userData["email"],
        onTap: () {
          //tap on a user --> go to chat page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverEmail: userData["email"],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
