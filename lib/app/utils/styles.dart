import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {

  static final appBarText = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontFamily: GoogleFonts.dmSans().fontFamily,
    letterSpacing: 1.2,
  );
    static final weekText = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.dmSans().fontFamily,
  );
      static final timeText = TextStyle(
    color: Colors.black,
    fontFamily: GoogleFonts.dmSans().fontFamily,
    
  );
     static final unAvailable = TextStyle(
    color: Colors.grey,
    fontFamily: GoogleFonts.dmSans().fontFamily,
    fontSize: 16.sp
  );
       static final messageStyle = TextStyle(
    color: Colors.black,
    fontFamily: GoogleFonts.dmSans().fontFamily,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    height: 1.5
  );
  static const Color primaryColor = Color(0xff7c6ad6);
   static  SizedBox h50 = SizedBox(height: 50.h,);
  static  SizedBox h100 = SizedBox(height: 100.h,);
  static MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}
}
