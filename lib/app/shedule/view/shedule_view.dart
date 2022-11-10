import 'package:flutter/material.dart';

class SheduleView extends StatelessWidget {
  const SheduleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Set your weekly hours",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}
