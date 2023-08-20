import 'package:firebase_auth/firebase_auth.dart';
import 'package:open_weather_test/data/auth/auth.dart';
import 'package:open_weather_test/data/auth/auth_error.dart';
import 'package:open_weather_test/data/model/auth_helper.dart';

class FBAuth extends Authorization {
  @override
  Future<AuthHelper> signInWithEmailAndPassword(
      {required String email, required String pass}) async {
    try {
      final User? user = await FirebaseAuth.instance.currentUser;
      if (user != null) {
        print('user loginend ${user.email}');
        await signOut();
      }

      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: pass);
      return AuthHelper(user: credential.user);
    } on FirebaseAuthException catch (e) {
      return AuthHelper(
          error: Error(code: e.code, messsage: authError[e.code]));
    }
  }

  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    print('user logout');
  }
}
