import 'package:KOOMPIACADEMY/screen/Comment/commentSection.dart';
import 'package:KOOMPIACADEMY/screen/Feedback/feedback.dart';
import 'package:KOOMPIACADEMY/screen/HomePage/Home/home.dart';
import 'package:KOOMPIACADEMY/screen/HomePage/School/school.dart';
import 'package:KOOMPIACADEMY/screen/LoginScreen/loginscreen.dart';
import 'package:KOOMPIACADEMY/screen/MyProgress/myprogress.dart';
import 'package:KOOMPIACADEMY/screen/ProfileScreen/profilescreen.dart';
import 'package:KOOMPIACADEMY/screen/SplashScreen/splashscreen.dart';
import 'package:KOOMPIACADEMY/screen/Support/help_support.dart';
import 'package:flutter/material.dart';
import 'screen/HomePage/Home/DetailCategory/list_all_by_category.dart';
import 'screen/HomePage/Home/DetailCategory/show_all_category.dart';
import 'screen/HomePage/Home/DetailCategory/show_sub_menu_category.dart';
import 'screen/HomePage/PlayVideo/videoPlay.dart';
import 'screen/HomePage/School/orginization.dart';
import 'screen/HomePage/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProfieUser(),
    );
  }
}
