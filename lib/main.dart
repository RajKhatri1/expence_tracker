import 'package:expence_tracker/screen/homepage/view/homescreen.dart';
import 'package:expence_tracker/screen/transcation_page/view/Trascation_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screen/datascreen/view/data_screen.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => Home_screen(),),
        GetPage(name: '/add', page: () => Transcation_screen(),),
        GetPage(name: '/data', page: () => DataScreen(),),
      ],
    ),
  );
}

