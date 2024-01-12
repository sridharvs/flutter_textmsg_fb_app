// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  //get instance of firebase
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
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

  //create a new message
  //construct chat room ID for the two users(sorted to ensure uniquness)

  //get message
}
