import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeperatorWidget extends StatelessWidget {
  const SeperatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
              color: Colors.grey,
              indent: 14.w,
              endIndent: 14.w,
            );
  }
}