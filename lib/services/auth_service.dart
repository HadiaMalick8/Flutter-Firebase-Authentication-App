import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../features/auth/model/user.dart';

class AuthService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<bool> isEmailAlreadyInUse(String email) async {
    try {
      CollectionReference users = _db.collection('Users');

      QuerySnapshot querySnapshot = await users.where('Email', isEqualTo: email).get();

      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print('Error checking email existence: $e');
      return false;
    }
  }

  //REGISTER
  Future<void> createUser(UserModel user, BuildContext context) async {
    try {
      await _db.collection("Users").add(user.toJson());
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User added successfully'),
        ),
      );
    } catch (error) {
      print('Error adding user: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error adding user. Please try again.'),
        ),
      );
    }
  }

  //LOGIN
  Future<void> signIn(BuildContext context, String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found') {
          print('No user found with this email.');
        } else if (e.code == 'wrong-password') {
          print(e.code);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${e.message}'),
            ),
          );
        } else {
          print('Error: ${e.message}');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${e.message}'),
            ),
          );
        }
      } else {
        print('Error: $e');
      }
    }
  }

  //FETCH USER DATA
  Future<UserModel> getUserDetails(String email) async {
    final snapshot = await _db.collection('Users').where('Email', isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

}
