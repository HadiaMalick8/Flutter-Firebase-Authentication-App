import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? uid;
  final String name;
  final String email;
  final String password;

  UserModel({
    this.uid,
    required this.email,
    required this.name,
    required this.password,
  });

  toJson() {
    return {
      "Name": name,
      "Email": email,
      "Password": password,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      uid: document.id,
      email: data["Email"],
      name: data["Name"],
      password: data["Password"],
    );
  }
}
