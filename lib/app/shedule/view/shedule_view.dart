import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weeklysheduler/app/utils/styles.dart';

class SheduleView extends StatelessWidget {
  const SheduleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
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
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                TickMark(),
                ChipWidget(title: "Morning"),
                ChipWidget(title: "Afternoon"),
                ChipWidget(title: "Evening"),
              ],
            );
              },
              separatorBuilder: (context, index) => const Divider(thickness: 1.5,),
              itemCount: 7,
            ),
             const Divider(thickness: 1.5,),
            SizedBox(
              height: 30.h,
            ),
            ElevatedButton(onPressed: (){}, child:  Text("Save",style: AppStyle.appBarText.copyWith(color: Colors.white,fontSize: 18.sp),))
          ],
        ),
      ),
    );
  }
}

class ChipWidget extends StatelessWidget {
  const ChipWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return ActionChip(
      padding: EdgeInsets.zero,
      label: Text(
        title,
        style:
            AppStyle.timeText.copyWith(color: Colors.purple, fontSize: 14.sp),
      ),
      onPressed: () {},
      backgroundColor: Colors.white,
      shape: const StadiumBorder(
          side: BorderSide(
        width: 1,
        color: Colors.purple,
      )),
    );
  }
}

class TickMark extends StatelessWidget {
  const TickMark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.w),
          child: Container(
            color: Colors.greenAccent.shade700,
            child: const Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          "SUN",
          style: AppStyle.weekText.copyWith(fontSize: 16.sp),
        )
      ],
    );
  }
}
