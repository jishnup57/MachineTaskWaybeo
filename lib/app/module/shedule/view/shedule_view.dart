import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weeklysheduler/app/module/shedule/controller/shedule_controller.dart';
import 'package:weeklysheduler/app/module/shedule/view/widget/chip.dart';
import 'package:weeklysheduler/app/module/shedule/view/widget/seperator.dart';
import 'package:weeklysheduler/app/module/shedule/view/widget/ticks.dart';
import 'package:weeklysheduler/app/utils/styles.dart';

class SheduleView extends StatelessWidget {
  const SheduleView({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    context.read<SheduleController>().fetchDB();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Set your weekly hours",
            style: AppStyle.appBarText.copyWith(fontSize: 16.sp),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          children: [
            Flexible(
              child: Consumer<SheduleController>(builder: (ctx, val, _) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final item = val.allSheduleList[index];
                    return ListTile(
                        leading: TickMark(day: item.day,unavailable: item.compleatlyBooked,),
                        title:item.compleatlyBooked? Padding(
                          padding:  EdgeInsets.only(left:8.0.r),
                          child: Text("Unavailable",style: AppStyle.unAvailable,),
                        ): Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ChipWidget(
                              title: "Morning",
                              index: index,
                              visible: item.morning,
                              type: SheduleType.mrg,
                              item: item,
                              ctrl: val,
                            ),
                            SizedBox(width: 8.w),
                            ChipWidget(
                              title: "Afternoon",
                              index: index,
                              visible: item.afternoon,
                              type: SheduleType.noon,
                              item: item,
                              ctrl: val,
                            ),
                            SizedBox(width: 8.w),
                            ChipWidget(
                              title: "Evening",
                              index: index,
                              visible: item.evening,
                              type: SheduleType.evg,
                              item: item,
                              ctrl: val,
                            ),
                             SizedBox(width: 10.w),
                          ],
                        ));
                  },
                  separatorBuilder: (context, index) => const SeperatorWidget(),
                  itemCount: val.allSheduleList.length,
                );
              }),
            ),
            const SeperatorWidget(),
            SizedBox(height: 35.h),
            ElevatedButton(
              onPressed: () {
                context.read<SheduleController>().onSave();
              },
              style: ElevatedButton.styleFrom(
                  primary: const Color(0xff7c6ad6),
                  minimumSize: Size(260.w, 40.h),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r))),
              child: Text(
                "Save",
                style: AppStyle.appBarText
                    .copyWith(color: Colors.white, fontSize: 16.sp),
              ),
            )
          ],
        ));
  }
}
