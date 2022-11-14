import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weeklysheduler/app/module/landing/controller/landing_controller.dart';
import 'package:weeklysheduler/app/module/landing/view/landing_view.dart';
import 'package:weeklysheduler/app/module/shedule/model/shedule_model.dart';

import 'package:weeklysheduler/app/utils/navigations.dart';
import 'package:weeklysheduler/app/utils/styles.dart';


enum SheduleType { mrg, noon, evg }

class SheduleController extends ChangeNotifier {




  List<SheduleModel> allSheduleList = [];
  fetchDB() async {
    final list = await LandingController().getAll();
    allSheduleList.clear();
    allSheduleList.addAll(list);
    notifyListeners();
  }

  onSave() async {
    await Future.forEach(bookingQueue, (SheduleModel element) async {
      if (element.morning == true &&
          element.afternoon == true &&
          element.evening == true) {
        element.compleatlyBooked = true;
      }
    });
    final box = await Hive.openBox<SheduleModel>('shedule.db');
    await Future.forEach(bookingQueue, (SheduleModel element) async {
      await box.put(element.id, element);
    });
    log("saved");
    bookingQueue.clear();
    
    RoutesNavigation.pushReplacement(const LandingView());
  }

  selecter(String title, int index) {
    switch (title) {
      case "Morning":
        allSheduleList[index].morning = true;
        break;
      case "Afternoon":
        allSheduleList[index].afternoon = true;
        break;
      case "Evening":
        allSheduleList[index].evening = true;
        break;
      default:
    }
    notifyListeners();
  }

  Color colorSelecter(SheduleType type, int index) {
    switch (type) {
      case SheduleType.mrg:
        if (allSheduleList[index].selMrg == true) {
          return Colors.grey;
        }
        return AppStyle.primaryColor;

      case SheduleType.noon:
        if (allSheduleList[index].selAft == true) {
          return Colors.grey;
        }
        return AppStyle.primaryColor;

      default:
        if (allSheduleList[index].selEve == true) {
          return Colors.grey;
        }
        return AppStyle.primaryColor;
    }
  }

  List<SheduleModel> bookingQueue = [];

  chipSelect(int index, SheduleModel item, SheduleType type) {
    switch (type) {
      case SheduleType.mrg:
        allSheduleList[index].selMrg = !allSheduleList[index].selMrg;
        if (allSheduleList[index].selMrg == true) {
          addToBookingQueue(item, type);
        } else {
          removeBookingQueue(item, type);
        }
        colorSelecter(type, index);
        break;
      case SheduleType.noon:
        allSheduleList[index].selAft = !allSheduleList[index].selAft;
        if (allSheduleList[index].selAft == true) {
          addToBookingQueue(item, type);
        } else {
          removeBookingQueue(item, type);
        }
        colorSelecter(type, index);
        break;
      default:
        allSheduleList[index].selEve = !allSheduleList[index].selEve;
        if (allSheduleList[index].selEve == true) {
          addToBookingQueue(item, type);
        } else {
          removeBookingQueue(item, type);
        }
        colorSelecter(type, index);
    }
    notifyListeners();
  }

  addToBookingQueue(SheduleModel item, SheduleType type) {
    int index = bookingQueue.indexWhere((element) => element.id == item.id);
    if (index == -1) {
      switch (type) {
        case SheduleType.mrg:
          bookingQueue.add(item.copyWith(morning: true, selMrg: true));
          break;
        case SheduleType.noon:
          bookingQueue.add(item.copyWith(afternoon: true, selAft: true));
          break;
        default:
          bookingQueue.add(item.copyWith(evening: true, selEve: true));
      }
      return;
    }
    final previousItem = bookingQueue[index];
    bookingQueue.removeAt(index);
    switch (type) {
      case SheduleType.mrg:
        final newItem = previousItem.copyWith(morning: true, selMrg: true);
        bookingQueue.add(newItem);
        break;
      case SheduleType.noon:
        final newItem = previousItem.copyWith(afternoon: true, selAft: true);
        bookingQueue.add(newItem);
        break;
      default:
        final newItem = previousItem.copyWith(evening: true, selEve: true);
        bookingQueue.add(newItem);
    }
  }

  removeBookingQueue(SheduleModel item, SheduleType type) {
    int index = bookingQueue.indexWhere((element) => element.id == item.id);
    if (index != -1) {
      final previousItem = bookingQueue[index];
      bookingQueue.removeAt(index);
      switch (type) {
        case SheduleType.mrg:
          final newItem = previousItem.copyWith(morning: false, selMrg: false);
          bookingQueue.add(newItem);
          break;
        case SheduleType.noon:
          final newItem =
              previousItem.copyWith(afternoon: false, selAft: false);
          bookingQueue.add(newItem);
          break;
        default:
          final newItem = previousItem.copyWith(evening: false, selEve: false);
          bookingQueue.add(newItem);
      }
    }
  }
}
