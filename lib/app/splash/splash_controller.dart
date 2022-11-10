
import 'dart:async';

import 'package:get/get.dart';

import '../landing/view/landing_view.dart';


class SplashController extends GetxController{
  
@override
  void onInit() {
   check();
    super.onInit();
  }
    check(){
    Timer(const Duration(seconds: 3), (){
      Get.off(()=> LandingView());
    });
  }
}