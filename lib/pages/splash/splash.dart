import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:open_weather_test/pages/splash/controllers/splash_controllers.dart';
import 'package:open_weather_test/utils/colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Get.put(SplashController());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    });
    super.initState();
  }

  @override
  void deactivate() {
    Get.delete<SplashController>();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(43),
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(gradient: bgSplash),
          child: const Column(children: [
            Expanded(
              flex: 7,
              child: Center(
                child: Text("WEATHER SERVICE",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w700,
                        color: Colors.white)),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text("dawn is coming soon",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                      color: Colors.white)),
            )
          ])),
    );
  }
}
