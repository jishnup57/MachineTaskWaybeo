import 'package:hive_flutter/hive_flutter.dart';
 part 'shedule_model.g.dart';
@HiveType(typeId: 1)
class SheduleModel{
  @HiveField(0)
  int id;

  @HiveField(1)
  String day;

  @HiveField(2)
  String date;

  @HiveField(3)
  bool compleatlyBooked;

  @HiveField(4)
  bool morning;

  @HiveField(5)
  bool afternoon;

  @HiveField(6)
  bool evening;
  SheduleModel({
    required this.id,
    required this.day,
    required this.date,
    required this.compleatlyBooked,
    required this.morning,
    required this.afternoon,
    required this.evening,
  });
}