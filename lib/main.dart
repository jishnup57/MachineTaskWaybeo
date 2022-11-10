import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weeklysheduler/app/shedule/model/shedule_model.dart';
import 'package:weeklysheduler/app/splash/view/splash_view.dart';


void main() async {
    WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(SheduleModelAdapter().typeId)) {
    Hive.registerAdapter(SheduleModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.purple,
            scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home:   Splash(),
      );
      },
    );
  }
}
