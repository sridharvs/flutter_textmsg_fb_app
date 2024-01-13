// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_textmsg_fb_app/models/message.dart';

class ChatService {
  //get instance of Firebase and Auth
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //get user stream
/*
List<Map<String,dynamic>=
[
  {
    'email': sri@gmail.com -------> List -----__|
    'id':1u3u23u13                              |
  }                                             |-------> Map    
  {                                             |        
    'email': sridhar7@gmail.com --------------__| 
    'id':1u3u23u14
  }
]
*/

  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        //gothrough each individual user
        final user = doc.data();
        //return user
        return user;
      }).toList();
    });
  }

  //send message
  Future<void> sendMessage(String receiverID, message) async {
    //get current user info
    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    //create a new message
    Message newMessage = Message(
      senderID: currentUserID, //DOUBT
      senderEmail: currentUserEmail, //DOUBT
      receiverID: receiverID,
      message: message,
      timestamp: timestamp,
    );
    //construct chat room ID for the two users(sorted to ensure uniquness)
    List<String> ids = [currentUserID, receiverID];
    ids.sort(); //sort the ids(this'll ensure the chatroomID is the same for 2Peoples)
    String chatRoomID = ids.join('_');
    //add new message to database
    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .add(newMessage.toMap());
  }

  //get message
  Stream<QuerySnapshot> getMessages(String userID, otherUserID) {
    //construct chat room ID for the two users
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatroomID = ids.join('_');
    return _firestore
        .collection("chat_rooms")
        .doc(chatroomID)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
