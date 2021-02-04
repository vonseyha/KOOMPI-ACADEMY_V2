import 'package:KOOMPIACADEMY/screen/HomePage/PlayVideo/videoPlay.dart';
import 'package:flutter/material.dart';

class ReuseCardCourse extends StatelessWidget {


  final String image_course;
  final String image_school_course;
  final String school_name;
  final String course_title;
  final String image_user;
  final String name_user;
  final int view;
  final int date;
  final String title_price;

   ReuseCardCourse(
    {
       this.image_course,
       this.image_school_course,
       this.school_name,
       this.course_title,
       this.image_user,
       this.name_user,
       this.view,
       this.date,
       this.title_price
    }
  );

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext ctx, int index) {
        return Card(
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PortfolioTutorialDetailPage()));
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.height / 2.3,
              child: Padding(
                padding: EdgeInsets.all(
                  10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          7,
                        ),
                        child: Image.network(
                          image_course,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        Image.network(
                          image_school_course,
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          school_name,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      course_title,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                            100,
                          ),
                          child: Image.network(
                            image_user,
                            width: 40,
                            height: 40,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 5,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name_user,
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "$view views - $date days ago",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 35,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Color(0xFF0f73ee),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          bottomRight: Radius.circular(
                            40,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          title_price,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext ctx, int index) {
        return SizedBox(
          width: 10,
        );
      },
      itemCount: 10,
    );
  }
}
