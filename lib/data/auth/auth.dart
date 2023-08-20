import 'package:open_weather_test/data/model/auth_helper.dart';

abstract class Authorization {
  Future<AuthHelper> signInWithEmailAndPassword(
      {required String email, required String pass});
  Future<void> signOut();
}
