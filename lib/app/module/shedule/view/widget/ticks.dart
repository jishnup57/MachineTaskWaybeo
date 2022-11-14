import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weeklysheduler/app/utils/styles.dart';

class TickMark extends StatelessWidget {
  const TickMark({Key? key, required this.day,required this.unavailable}) : super(key: key);
  final String day;
  final bool unavailable;
  @override
  Widget build(BuildContext context) {
    return Row(
      
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.w),
          child: Container(
            color: unavailable?Colors.grey.shade400: Colors.greenAccent.shade700,
            child: const Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 4.w,
        ),
        Text(
          day,
          style: AppStyle.weekText.copyWith(fontSize: 16),
        )
      ],
    );
  }
}