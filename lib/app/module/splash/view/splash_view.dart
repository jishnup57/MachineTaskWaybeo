import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weeklysheduler/app/module/splash/splash_controller.dart';
class Splash extends StatelessWidget {
   const Splash({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    context.read<SplashController>().check();
    return   Scaffold(
      body: Center(
        child: Lottie.asset("assets/splashloading.json")
      ),
    );
  }
}