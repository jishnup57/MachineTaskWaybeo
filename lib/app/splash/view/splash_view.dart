import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

import '../splash_controller.dart';
class Splash extends StatelessWidget {
   Splash({Key? key}) : super(key: key);
  final controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Center(
        child: Lottie.asset("assets/splashloading.json")
      ),
    );
  }
}