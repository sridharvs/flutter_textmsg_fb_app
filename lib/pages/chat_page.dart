import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_textmsg_fb_app/components/my_textfield.dart';
import 'package:flutter_textmsg_fb_app/services/auth/auth_service.dart';
import 'package:flutter_textmsg_fb_app/services/chat/chat_service.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;
  ChatPage({super.key, required this.receiverEmail, required this.receiverID});

  //text controller
  final TextEditingController _messageController = TextEditingController();
  //chat & auth service file
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  //send messaege
  Future<void> sendMessage() async {
    //if there is something in the textfield
    if (_messageController.text.isNotEmpty) {
      //send the message
      await _chatService.sendMessage(receiverID, _messageController.text);
      //clear the controller
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverEmail),
      ),
      body: Column(
        children: [
          //display all messages
          Expanded(
            child: _buildMessageList(),
          ),
          //user input
          _buildUserInput(),
        ],
      ),
    );
  }

  //build meaage list
  Widget _buildMessageList() {
    String senderID = _authService.getCurrentuser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessages(receiverID, senderID),
      builder: (context, snapshot) {
        //errors
        if (snapshot.hasError) {
          return Text("Error");
        }
        // loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading..");
        }
        //return list view
        return ListView(
          children: snapshot.data!.docs
              .map((doc) => _buildMessageIndividualItem(doc))
              .toList(),
        );
      },
    );
  }

  //build message individual item
  Widget _buildMessageIndividualItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    //is current user?
    bool isCurrentUser = data['senderID'] == _authService.getCurrentuser()!.uid;
    //align the message to right side  for sender, otherwise left side
    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: Text(
        data["message"],
      ),
    );
  }

  //build message input
  Widget _buildUserInput() {
    return Row(
      children: [
        //textfield should take up most of the
        Expanded(
          child: MyTextField(
            hintText: "Type message here",
            obscureText: false,
            controller: _messageController,
          ),
        ),
        //send button
        IconButton(
          onPressed: sendMessage,
          icon: Icon(
            Icons.send,
          ),
        ),
      ],
    );
  }
}
