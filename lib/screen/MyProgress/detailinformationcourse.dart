import 'package:KOOMPIACADEMY/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ReuseDetailCourse extends StatelessWidget {

  final String image_course;
  final String image_school_course;
  final String school_name;
  final String course_title;
  final String image_user;
  final String name_user;
  final int view;
  final int date;
  final String title_price;
  final double progress;

   ReuseDetailCourse(
    {
      this.image_course,
      this.image_school_course,
      this.school_name,
      this.course_title,
      this.image_user,
      this.name_user,
      this.view,
      this.date,
      this.title_price,
      this.progress,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              width: 120,
              height: 160.0,
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://www.wowmakers.com/blog/wp-content/uploads/2019/02/Video-thumbnail.jpg"
                ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      "https://cdn3.iconfinder.com/data/icons/online-shopping-line-6/154/Untitled-1-20-512.png",
                      height: 30,
                      width: 30,
                    ),
                    SizedBox(
                      width: 7.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            "SALA KOOMPI",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 7.0,
                          ),
                          Text(
                            "KOOMPI GUIDELINES",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.2,
                                      color: Colors.white),
                                  borderRadius:
                                      BorderRadius.circular(
                                          25.0),
                                  color: kPrimaryColor,
                                ),
                                child: CircleAvatar(
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Colors.white,
                                    backgroundImage: NetworkImage(
                                        "https://s.hdnux.com/photos/51/23/24/10827008/3/rawImage.jpg"
                                        ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "San Vuthy",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight:
                                              FontWeight.w500),
                                    ),
                                    Text("182view - 30 days")
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  height: 30.0,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            Colors.blueAccent),
                                    borderRadius:
                                        BorderRadius.circular(
                                            5.0),
                                    color: kPrimaryColor,
                                  ),
                                  child: Text(
                                    "តម្លៃ: ឥតគិតថ្លៃ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight:
                                            FontWeight.w500),
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              CircularPercentIndicator(
                                radius: 40.0,
                                lineWidth: 4.0,
                                animation: true,
                                percent: 0.8,
                                center: new Text(
                                  "80.0%",
                                  style: new TextStyle(
                                      fontWeight:
                                          FontWeight.bold,
                                      fontSize: 10.0),
                                ),
                                circularStrokeCap:
                                    CircularStrokeCap.round,
                                progressColor: Colors.blue,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}