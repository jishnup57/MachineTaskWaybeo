import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:weeklysheduler/app/module/landing/controller/landing_controller.dart';
import 'package:weeklysheduler/app/module/shedule/view/shedule_view.dart';
import 'package:weeklysheduler/app/utils/navigations.dart';
import 'package:weeklysheduler/app/utils/styles.dart';

class LandingView extends StatelessWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<LandingController>().rebuild();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.r),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton.icon(
                      onPressed: () =>context.read<LandingController>().reset(),
                      icon: const Icon(
                        Icons.restore,
                        color: Colors.red,
                      ),
                      label: Text(
                        "REST",
                        style:
                            AppStyle.messageStyle.copyWith(color: Colors.red),
                      )),
                ],
              ),
              AppStyle.h100,
              Consumer<LandingController>(builder: (controller, value, _) {
                return Text(
                  value.message,
                  style: AppStyle.messageStyle,
                  textAlign: TextAlign.justify,
                );
              }),
              AppStyle.h50,
              ElevatedButton(
                onPressed: () {
                  RoutesNavigation.pushReplacement(const SheduleView());
                },
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xff7c6ad6),
                    minimumSize: Size(260.w, 40.h),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: Text(
                  "Shedule",
                  style: AppStyle.appBarText
                      .copyWith(color: Colors.white, fontSize: 16.sp),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
