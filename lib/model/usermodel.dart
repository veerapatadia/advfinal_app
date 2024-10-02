import 'package:flutter/cupertino.dart';

class Users {
  int? id;
  String? username;
  String? email;
  String? password;

  Users(
      {required this.password,
      required this.email,
      required this.username,
      required this.id});

  factory Users.fromMap({required Map<String, dynamic> data}) {
    return Users(
        id: data['id'],
        password: data['password'],
        email: data['email'],
        username: data['username']);
  }
}
