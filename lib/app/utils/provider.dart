import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weeklysheduler/app/module/landing/controller/landing_controller.dart';
import 'package:weeklysheduler/app/module/shedule/controller/shedule_controller.dart';
import 'package:weeklysheduler/app/module/splash/splash_controller.dart';


class ProviderRaper extends StatelessWidget {
  const ProviderRaper({Key? key,required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
   return MultiProvider(providers:  [
    ChangeNotifierProvider(create: (_)=>SplashController()),
    ChangeNotifierProvider(create: (_)=>LandingController()),
    ChangeNotifierProvider(create: (_)=>SheduleController()),
  
   ],child: child,);
  }
}