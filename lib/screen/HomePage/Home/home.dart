import 'package:KOOMPIACADEMY/screen/Feedback/feedback.dart';
import 'package:KOOMPIACADEMY/screen/HomePage/PlayVideo/videoPlay.dart';
import 'package:KOOMPIACADEMY/screen/IntroScreen/introscreen.dart';
import 'package:KOOMPIACADEMY/screen/MyProgress/myprogress.dart';
import 'package:KOOMPIACADEMY/screen/ProfileScreen/profilescreen.dart';
import 'package:KOOMPIACADEMY/screen/Support/help_support.dart';
import 'package:KOOMPIACADEMY/widget/Card/reuse_card_course.dart';
import 'package:KOOMPIACADEMY/widget/reuse_text_space_between.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'DetailCategory/drawer.dart';
import 'DetailCategory/list_all_by_category.dart';
import 'DetailCategory/show_all_category.dart';
import 'DetailCategory/show_sub_menu_category.dart';
import 'data.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: GestureDetector(
            child: SvgPicture.asset("images/menu.svg",
                width: 10, color: Colors.white),
            onTap: () {
              _scaffoldKey.currentState.openDrawer();
            },
          ),
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
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReuseTextSpaceBetween(
              first_text: "Categories",
              end_text: "Show All",
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ShowAllCategory()));
              },
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              height: 170,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemBuilder: (BuildContext ctx, int index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ShowSubMenuCategory()));
                    },
                    child: Container(
                      width: 100,
                      height: 110,
                      child: Column(
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            child: SvgPicture.network(
                              recommendations[index].url,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            recommendations[index].title,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: recommendations.length,
              ),
            ),
            ReuseTextSpaceBetween(
              first_text: "Course",
              end_text: "Show All",
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ListAllCourseByCategory()));
              },
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2.3,
              child: ReuseCardCourse(
                image_course: "https://www.wowmakers.com/blog/wp-content/uploads/2019/02/Video-thumbnail.jpg",
                image_school_course: "https://img.icons8.com/pastel-glyph/2x/home.png",
                school_name: "Content Creator Guideline",
                course_title: "ចេកទេសធ្វើវិដេអូមេរៀន",
                image_user: "https://salabackend.koompi.com/public/uploads/avatar-88cd57f2-1524-475e-ba57-18e7fddbfa18.png",
                name_user: "KOOMPI STEAM",
                view: 12,
                date: 7,
                title_price: "តម្លៃៈ ឥតគិតថ្លៃ",

              ),
            ),
          ],
        ),
      ),
    );
  }
}

