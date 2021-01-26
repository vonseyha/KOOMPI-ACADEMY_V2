import 'package:KOOMPIACADEMY/screen/LoginScreen/loginscreen.dart';
import 'package:KOOMPIACADEMY/screen/LoginScreen/reset_password.dart';
import 'package:KOOMPIACADEMY/screen/RegisterScreen/registerscreen.dart';
import 'package:flutter/material.dart';

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
      home: ResetPassword(),
    );
  }
}
