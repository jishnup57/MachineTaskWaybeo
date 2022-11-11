import 'package:hive_flutter/hive_flutter.dart';
part 'shedule_model.g.dart';

@HiveType(typeId: 1)
class SheduleModel {
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

  @HiveField(7)
  bool selMrg;

  @HiveField(8)
  bool selAft;

  @HiveField(9)
  bool selEve;
  SheduleModel({
    required this.id,
    required this.day,
    required this.date,
    required this.compleatlyBooked,
    required this.morning,
    required this.afternoon,
    required this.evening,
    required this.selMrg,
    required this.selAft,
    required this.selEve,
  });

  SheduleModel copyWith(
      {int? id,
      String? day,
      String? date,
      bool? compleatlyBooked,
      bool? morning,
      bool? afternoon,
      bool? evening,
      bool? selMrg,
      bool? selAft,
      bool? selEve}) {
    return SheduleModel(
      id: id ?? this.id,
      day: day ?? this.day,
      date: date ?? this.date,
      compleatlyBooked: compleatlyBooked ?? this.compleatlyBooked,
      morning: morning ?? this.morning,
      afternoon: afternoon ?? this.afternoon,
      evening: evening ?? this.evening,
      selMrg: selMrg ?? this.selMrg,
      selAft: selAft ?? this.selAft,
      selEve: selEve ?? this.selEve,
    );
  }
  @override
  String toString() {
    return 'SheduleModel(id: $id, day: $day, date: $date, compleatlyBooked: $compleatlyBooked, morning: $morning, afternoon: $afternoon, evening: $evening, selMrg: $selMrg, selAft: $selAft, selEve: $selEve)';
     
  }
}
