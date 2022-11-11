import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weeklysheduler/app/utils/styles.dart';

class TickMark extends StatelessWidget {
  const TickMark({Key? key, required this.day}) : super(key: key);
  final String day;
  @override
  Widget build(BuildContext context) {
     ScreenUtil.init(context);
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
        Text(
          day,
          style: AppStyle.weekText.copyWith(fontSize: 16),
        )
      ],
    );
  }
}