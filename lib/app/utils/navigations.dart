import 'package:flutter/material.dart';

class RoutesNavigation {
  static final statekey = GlobalKey<NavigatorState>();
  static push(Widget child){
    statekey.currentState!.push(MaterialPageRoute(builder: (context)=>child));
  }
  static pushReplacement(Widget child){
    statekey.currentState!.pushReplacement(MaterialPageRoute(builder: (context)=>child));
  }
  static pop(){
    statekey.currentState!.pop();
  }
}