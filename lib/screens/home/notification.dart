import 'package:flutter/material.dart';

import '../../main.dart';
import 'home.dart';

Widget notificationPage(BuildContext context) {
  double screenHeight = MediaQuery.of(context).size.height;
  double screenWidth = MediaQuery.of(context).size.width;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(
        height: screenHeight * .1,
        width: screenWidth,
      ),
      AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.fastLinearToSlowEaseIn,
        height: HomeState.notPressed ? screenHeight * .7 : 0,
        width: screenWidth * .91,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.black),
      ),
    ],
  );
}
