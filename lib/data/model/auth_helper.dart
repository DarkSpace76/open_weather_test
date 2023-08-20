import 'package:firebase_auth/firebase_auth.dart';

class Error {
  String? code;
  String? messsage;

  Error({this.code, this.messsage});
}

class AuthHelper {
  User? user;
  Error? error;

  AuthHelper({this.user, this.error});

  bool hasError() => user == null;
}
