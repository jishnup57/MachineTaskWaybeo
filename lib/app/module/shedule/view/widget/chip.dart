import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weeklysheduler/app/module/shedule/controller/shedule_controller.dart';
import 'package:weeklysheduler/app/module/shedule/model/shedule_model.dart';
import 'package:weeklysheduler/app/utils/styles.dart';

class ChipWidget extends StatelessWidget {
  const ChipWidget({
    Key? key,
    required this.title,
    required this.index,
    required this.visible,
    required this.type,
    required this.item,
    required this.ctrl
  }) : super(key: key);
  final bool visible;
  final String title;
  final int index;
  final SheduleType type;
  final SheduleModel item;
  final SheduleController ctrl;
  @override
  Widget build(BuildContext context) {
    return ActionChip(
      padding: EdgeInsets.zero,
      label: visible == true
          ? Text(title,
              style: AppStyle.timeText
                  .copyWith(color: Colors.grey, fontSize: 14.sp))
          : Text(
              title,
              style: AppStyle.timeText.copyWith(
                  color: ctrl.colorSelecter(type, index), fontSize: 14.sp),
            ),
      onPressed: () {
        if (!visible) {
          ctrl.chipSelect(index, item, type);
        }
      },
      backgroundColor: Colors.white,
      shape: visible == true
          ? const StadiumBorder(
              side: BorderSide(
              width: 1,
              color: Colors.grey,
            ))
          : StadiumBorder(
              side: BorderSide(
              width: 1,
              color: ctrl.colorSelecter(type, index),
            )),
    );
  }
}
