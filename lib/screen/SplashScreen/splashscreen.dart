import 'dart:async';

import 'package:KOOMPIACADEMY/screen/IntroScreen/introscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


    Future<String> _isSeen() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.getString('seen');
  }

  Future<String> _isToken() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    return _pref.getString('token');
  }

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => IntroScreen()));
      print("Already!!!");
    });
  }


  @override
  Widget build(BuildContext context) {
   return Container(
     color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("images/logo_koompi_black.png", height: 160),
          SizedBox(height: 15.0),
          SpinKitCircle(color: Colors.black, size: 30),
        ],
      ),
    );
  }
}