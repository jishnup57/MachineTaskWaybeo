import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weeklysheduler/app/landing/controller/landing_controller.dart';
import 'package:weeklysheduler/app/shedule/model/shedule_model.dart';

enum SheduleType { mrg, noon, evg }

class SheduleController extends GetxController {
  @override
  void onInit() async {
    await fetchDB();
    super.onInit();
  }

  List<SheduleModel> allSheduleList = [];
  fetchDB() async {
    final list = await LandingController().getAll();
    allSheduleList.clear();
    allSheduleList.addAll(list);
    update();
  }

  onSave() async {
    await Future.forEach(bookingQueue, (SheduleModel element) async {
      if (element.morning == true &&
          element.afternoon == true &&
          element.evening == true) {
        element.compleatlyBooked == true;
      }
    });
    final box = await Hive.openBox<SheduleModel>('shedule.db');
    await Future.forEach(bookingQueue, (SheduleModel element) async {
      await box.put(element.id, element);
    });
    bookingQueue.clear();
    Get.back();
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
    update();
  }

  Color colorSelecter(SheduleType type, int index) {
    switch (type) {
      case SheduleType.mrg:
        if (allSheduleList[index].selMrg == true) {
          return Colors.grey;
        }
        return Colors.purple;

      case SheduleType.noon:
        if (allSheduleList[index].selAft == true) {
          return Colors.grey;
        }
        return Colors.purple;

      default:
        if (allSheduleList[index].selEve == true) {
          return Colors.grey;
        }
        return Colors.purple;
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
    update();
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
