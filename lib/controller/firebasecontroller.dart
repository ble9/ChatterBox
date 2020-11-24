
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class FirebaseController {
  static Future signIn(String email, String password) async {
    UserCredential auth =
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return auth.user;
  }

  static Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static Future<void> signUp(String email, String password) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  static Future<void> resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    print("============email sent");
  }

  getUserByUsername(String name) async {
    return await FirebaseFirestore.instance.collection('users')
      .where("username", isEqualTo: name).get();
  }

  getUserByUserEmail(String email) async {
    return await FirebaseFirestore.instance.collection('users')
      .where("email", isEqualTo: email).get();
  }

  uploadUserInfo(userMap) {
    FirebaseFirestore.instance.collection('users')
      .add(userMap);
  }

  createChatRoom(String chatRoomID, chatRoomMap) {
    FirebaseFirestore.instance.collection('chatroom')
      .doc(chatRoomID).set(chatRoomMap).catchError((e) {
        print(e.toString());
      });
  }

  getUserInfo(String email) async {
    return FirebaseFirestore.instance
        .collection("users")
        .where("email", isEqualTo: email)
        .get()
        .catchError((e) {
      print(e.toString());
    });
  }

  addConvoMessages(String chatRoomID, messageMap) {
    
    return FirebaseFirestore.instance
      .collection('chatroom')
      .doc(chatRoomID)
      .collection('chats')
      .add(messageMap)
      .catchError((e) {print(e.toString());});
  } 

  getConvoMessages(String chatRoomID) async {
    
    return await FirebaseFirestore.instance
      .collection('chatroom')
      .doc(chatRoomID)
      .collection('chats')
      .orderBy("time", descending: false)
      .snapshots();
  }
}