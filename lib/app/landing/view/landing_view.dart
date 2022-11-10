import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weeklysheduler/app/landing/controller/landing_controller.dart';
import 'package:weeklysheduler/app/shedule/view/shedule_view.dart';

class LandingView extends StatelessWidget {
   LandingView({Key? key}) : super(key: key);
  final controller = Get.put(LandingController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Landing View"),
            TextButton(onPressed: (){
              Get.to(()=> SheduleView());
            }, child: const Text("Go to Shedule View"))
          ],
        ),
      ),
    
    );
  }
}