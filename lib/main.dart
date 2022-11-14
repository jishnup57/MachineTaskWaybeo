import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weeklysheduler/app/module/shedule/model/shedule_model.dart';
import 'package:weeklysheduler/app/module/splash/view/splash_view.dart';
import 'package:weeklysheduler/app/utils/navigations.dart';
import 'package:weeklysheduler/app/utils/provider.dart';
import 'package:weeklysheduler/app/utils/styles.dart';


void main() async {
    WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(SheduleModelAdapter().typeId)) {
    Hive.registerAdapter(SheduleModelAdapter());
  }
  runApp(const ProviderRaper(child: MyApp()));
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
        return MaterialApp(
          navigatorKey: RoutesNavigation.statekey,
        theme: ThemeData(
            primarySwatch: AppStyle. buildMaterialColor(const Color(0xff7c6ad6)),
            scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home:   const Splash(),
      );
      },
    );
  }
}
