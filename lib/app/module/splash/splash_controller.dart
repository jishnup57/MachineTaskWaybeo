
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:weeklysheduler/app/module/landing/controller/landing_controller.dart';
import 'package:weeklysheduler/app/utils/navigations.dart';

import '../landing/view/landing_view.dart';


class SplashController extends ChangeNotifier{
  
    check()async{
    await LandingController(). createSheduleDB();
    await Future.delayed(const Duration(seconds: 2), (){
      RoutesNavigation.pushReplacement(const LandingView());
    });
  }
}