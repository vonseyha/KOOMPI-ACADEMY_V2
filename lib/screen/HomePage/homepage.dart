import 'package:KOOMPIACADEMY/screen/HomePage/test.dart';
import 'package:KOOMPIACADEMY/screen/LoginScreen/loginscreen.dart';
import 'package:KOOMPIACADEMY/screen/LoginScreen/reset_password.dart';
import 'package:KOOMPIACADEMY/screen/MyProgress/myprogress.dart';
import 'package:flutter/material.dart';

import 'Home/home.dart';
import 'School/school.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
  
class _HomePageState extends State<HomePage> {
   int _seletedItem = 0;
  var _pages = [Home(), School(), MyProgress()];
  @override  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _pages[_seletedItem]),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), title: Text('Homepage')),
          BottomNavigationBarItem(icon: Icon(Icons.school_outlined), title: Text('School')),
          BottomNavigationBarItem(icon: Icon(Icons.assessment_outlined), title: Text('My Progess'))
        ],
        currentIndex: _seletedItem,
        onTap: (index){
          setState(() {
            _seletedItem = index;
          });
        },
      ),
    );
  }
}