
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weeklysheduler/app/module/shedule/model/shedule_model.dart';

class LandingController extends ChangeNotifier {
  late SharedPreferences sp;
  String message = '';
  rebuild() async {
    await createSheduleDB();
    sheduleList = await getAll();
    await createMessage();
  }

  List<SheduleModel> sheduleList = [];
  createSheduleDB() async {
    sp = await SharedPreferences.getInstance();
    final value = sp.getBool("is_avl") ?? false;
    if (value) {
      return;
    }
    List<int> itrable = [0, 1, 2, 3, 4, 5, 6];
    final box = await Hive.openBox<SheduleModel>('shedule.db');
    await Future.forEach(itrable, (int e) async {
      final obj = SheduleModel(
        id: e,
        day: generateDay(e),
        date: "",
        compleatlyBooked: false,
        morning: false,
        afternoon: false,
        evening: false,
        selMrg: false,
        selAft: false,
        selEve: false,
      );
      await box.put(e, obj);
    });
    await addToSharedPref();
  }

  String generateDay(int i) {
    switch (i) {
      case 0:
        return 'SUN';
      case 1:
        return 'MON';
      case 2:
        return 'TUE';
      case 3:
        return 'WED';
      case 4:
        return 'THU';
      case 5:
        return 'FRI';
      default:
        return 'SAT';
    }
  }

  createMessage() {
    int count = 0;
    message = "Hi Jose you are available";
    for (var i = 0; i < sheduleList.length; i++) {
      SheduleModel item = sheduleList[i];
      if (item.compleatlyBooked) {
        count++;
        continue;
      }
      message += " ${generateFullDay(i)}";
      if (!item.morning && !item.afternoon && !item.evening) {
        message += " whole day,";
        continue;
      }
      if (!item.morning) {
        message += " morning";
      }
      if (!item.afternoon) {
        message += " afternoon";
      }
      if (!item.evening) {
        message += " evening";
      }
      message += ",";
    }
      if (count == 7) {
      message = "Hi Jose you are unavailable on this week!";
      notifyListeners();
      return;
    }
    message = message.substring(0, message.length - 1);
    dynamic list = message.split("");
    list = list.reversed.toList();
    final index = list.indexWhere((element) => element == ",");
    if (index == -1) {
      return;
    }
    list.insert(index + 1, " and");
    list.removeAt(index);
    message = list.reversed.join();
    notifyListeners();
  }

  String generateFullDay(int id) {
    switch (id) {
      case 0:
        return 'Sunday';
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      default:
        return 'Saturday';
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

  reset() {
    sp.setBool("is_avl", false);
    rebuild();
  }
}
