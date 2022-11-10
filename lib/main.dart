import 'package:flutter/material.dart';
import 'package:weeklysheduler/app/shedule/view/shedule_view.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Colors.white
      ),
      debugShowCheckedModeBanner: false,
      home: const SheduleView(),
    );
  }
}