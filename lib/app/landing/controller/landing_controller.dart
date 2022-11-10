import 'dart:developer';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weeklysheduler/app/shedule/model/shedule_model.dart';

class LandingController extends GetxController {
  @override
  void onInit() async {
    log("on init");
    await createSheduleDB();
    super.onInit();
  }

  createSheduleDB() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final value = sp.getBool("is_avl")??false;
    if(value){
        return;
    }
    log("create called");
    final box = await Hive.openBox<SheduleModel>('shedule.db');
    for (var i = 1; i <= 7; i++) {
      final obj = SheduleModel(
        id: i,
        day: generateDay(i),
        date: "01.01.2021",
        compleatlyBooked: false,
        morning: false,
        afternoon: false,
        evening: false,
      );
      await box.put(i, obj);
    }
     final list = await getAll();
     print(list);
    await addToSharedPref();
  }

  String generateDay(int i) {
    switch (i) {
      case 1:
        return 'SUN';
      case 2:
        return 'MON';
      case 3:
        return 'TUE';
      case 4:
        return 'WED';
      case 5:
        return 'THU';
      case 6:
        return 'FRI';
      default:
        return 'SAT';
    }
  }

  Future<List<SheduleModel>> getAll() async {
    final allShedules = await Hive.openBox<SheduleModel>('shedule.db');
    return allShedules.values.toList();
  }

  addToSharedPref() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool("is_avl", true);
  }
}
