import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:open_weather_test/components/app_text.dart';
import 'package:open_weather_test/pages/login/components/button.dart';
import 'package:open_weather_test/pages/login/components/input.dart';
import 'package:open_weather_test/pages/login/controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController loginController = Get.put(LoginController());

  final inputKey = GlobalKey<FormState>();
  final TextEditingController email =
      TextEditingController(text: 'test@test.com');
  final TextEditingController pass = TextEditingController(text: 'testtest');

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    });
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    Get.delete<LoginController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: inputKey,
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              height: double.infinity,
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 11, bottom: 16),
                    width: double.infinity,
                    height: 130,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 11),
                        AppText.h1('Вход'),
                        const SizedBox(height: 12),
                        AppText.b2('Введите данные для входа'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 24),
                    child: LoginInput(
                      controller: email,
                      hint: 'Email',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: LoginInput.makePass(
                      hint: 'Пароль',
                      controller: pass,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: authButton(onPressed: () {
                      //Get.to(() => HomePage());
                      if (inputKey.currentState!.validate()) {
                        loginController.sigIn(email.text, pass.text);
                      }
                    }),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
