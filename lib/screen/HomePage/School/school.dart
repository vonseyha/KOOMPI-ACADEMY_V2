import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tabbar/tabbar.dart';

import 'all_school.dart';
import 'my_school.dart';
import 'school_join.dart';

class School extends StatefulWidget {
  @override
  _SchoolState createState() => _SchoolState();
}

class _SchoolState extends State<School> {
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset("images/menu.svg",
              width: 10, color: Colors.white),
        ),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            width: _screenSize.width - 75,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                ),
              ),
            ),
          )
        ],
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: TabbarHeader(
            controller: controller,
            tabs: [
              Tab(text: "សាលារបស់ខ្ញុំបង្កើត"),
              Tab(text: "សាលាដែលបានចូលរួម"),
              Tab(text: "សាលាផ្សេងៗ"),
            ],
          ),
        ),
      ),
      body: TabbarContent(
        controller: controller,
        children: <Widget>[
          Container(child: MySchool(),),
          Container(child: JoinSchool()),
          Container(child: AllSchool(),),
        ],
      ),
    );
  }
}
