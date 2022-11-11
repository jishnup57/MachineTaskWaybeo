import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:weeklysheduler/app/shedule/controller/shedule_controller.dart';
import 'package:weeklysheduler/app/shedule/model/shedule_model.dart';
import 'package:weeklysheduler/app/shedule/view/widget/ticks.dart';
import 'package:weeklysheduler/app/utils/styles.dart';

class SheduleView extends StatelessWidget {
  SheduleView({Key? key}) : super(key: key);
  final SheduleController ctrl = Get.put(SheduleController());
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Set your weekly hours",
          style: AppStyle.appBarText.copyWith(fontSize: 20.sp),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            GetBuilder<SheduleController>(
              builder: (ctrl) => ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final item = ctrl.allSheduleList[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(flex: 1, child: TickMark(day: item.day)),
                      Expanded(
                        flex: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ChipWidget(
                              title: "Morning",
                              index: index,
                              visible: item.morning,
                              type: SheduleType.mrg,
                              item: item,
                            ),
                            ChipWidget(
                              title: "Afternoon",
                              index: index,
                              visible: item.afternoon,
                              type: SheduleType.noon,
                              item: item,
                            ),
                            ChipWidget(
                              title: "Evening",
                              index: index,
                              visible: item.evening,
                              type: SheduleType.evg,
                              item: item,
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                  thickness: 1.5,
                ),
                itemCount: ctrl.allSheduleList.length,
              ),
            ),
            const Divider(
              thickness: 1.5,
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: ElevatedButton(
                onPressed: () {
                   ctrl.onSave();
                 
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: Text(
                  "Save",
                  style: AppStyle.appBarText
                      .copyWith(color: Colors.white, fontSize: 16.sp),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ChipWidget extends StatelessWidget {
  ChipWidget({
    Key? key,
    required this.title,
    required this.index,
    required this.visible,
    required this.type,
    required this.item,
  }) : super(key: key);
  final bool visible;
  final String title;
  final int index;
  final SheduleController ctrl = Get.find<SheduleController>();
  final SheduleType type;
  final SheduleModel item;
  @override
  Widget build(BuildContext context) {
    return ActionChip(
      padding: EdgeInsets.zero,
      label: visible == true
          ? Text(title,
              style: AppStyle.timeText
                  .copyWith(color: Colors.grey, fontSize: 14.sp)
              )
          : Text(
              title,
              style: AppStyle.timeText.copyWith(
                  color: ctrl.colorSelecter(type, index), fontSize: 14.sp),
            ),
      onPressed: () {
        if (!visible) {
          ctrl.chipSelect( index,item, type);
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


