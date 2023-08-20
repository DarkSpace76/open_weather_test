import 'package:get/get.dart';
import 'package:open_weather_test/data/auth/auth.dart';
import 'package:open_weather_test/data/auth/auth_error.dart';
import 'package:open_weather_test/data/auth/google_auth.dart';
import 'package:open_weather_test/data/model/auth_helper.dart';
import 'package:open_weather_test/pages/home/home.dart';

class LoginController extends GetxController {
  Authorization auth = FBAuth();

  void sigIn(String email, String pass) async {
    final AuthHelper response =
        await auth.signInWithEmailAndPassword(email: email, pass: pass);
    if (response.hasError()) {
      print('${response.error?.code} - ${getAuthError(response.error?.code)}');

      Get.snackbar('Error', getAuthError(response.error?.code) ?? '');
    } else {
      Get.to(() => HomePage());
      print('user logined - ${response.user?.email}');
    }
  }
}
