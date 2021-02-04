import 'package:KOOMPIACADEMY/screen/Feedback/feedback.dart';
import 'package:KOOMPIACADEMY/screen/IntroScreen/introscreen.dart';
import 'package:KOOMPIACADEMY/screen/MyProgress/myprogress.dart';
import 'package:KOOMPIACADEMY/screen/ProfileScreen/profilescreen.dart';
import 'package:KOOMPIACADEMY/screen/Support/help_support.dart';
import 'package:flutter/material.dart';

import 'header_drawer.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          HeaderDrawer(
            image_user: "https://salabackend.koompi.com/public/uploads/avatar-88cd57f2-1524-475e-ba57-18e7fddbfa18.png",
            name: "KOOMPI STEAM",
            email: "koompi@gmail.com",
          ),
          _createDrawerItem(
            icon: Icons.settings_applications_outlined,
            text: ' ការកំណត់',
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProfieUser()));
            }
          ),
          _createDrawerItem(
            icon: Icons.event_note_outlined,
            text: 'វគ្គសិក្សារបស់ខ្ញុំ',
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyProgress()));
            }
          ),
          _createDrawerItem(
            icon: Icons.help_center_outlined,
            text: 'ជំនួយ',
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => HelpSupport()));
            }
          ),
          _createDrawerItem(
            icon: Icons.question_answer_outlined,
            text: 'បញ្ចេញជាមតិយោបល់',
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => FeedBack()));
            }
          ),
          Divider(),
          _createDrawerItem(
            icon: Icons.logout,
            text: 'ចាកចេញ',
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => IntroScreen()));
            }
          ),
        ],
      ),
    );
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text,style: TextStyle(fontSize: 20)),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}