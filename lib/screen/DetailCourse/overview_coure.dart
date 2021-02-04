import 'package:flutter/material.dart';

class OverviewCourse extends StatefulWidget {
  @override
  _OverviewCourseState createState() => _OverviewCourseState();
}

class _OverviewCourseState extends State<OverviewCourse> {
  @override
  Widget build(BuildContext context) {
    var dataw = MediaQuery.of(context);
    return Scaffold(
      body: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) {
          // var desc;
          // var string = repositories[index]['description'];
          // for (var i = 0; i < string.length; i++) {
          //   desc =  string.replaceAll('<p>', '').replaceAll('</p>', '');
          // }
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      height: dataw.size.width / 2.5,
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("ចំណងជើងមេរៀន: បច្ចេកទេសធ្វើវីដេអូមេរៀន",
                                style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w700)),
                            Text("80 ទស្សនា បង្កើតនៅ: 9 days ago"),
                            SizedBox(height: 10),
                            Text("MediaQueryDa Another exception use of ParentDataWidget.MediaQueryDa Another exception was thrown: Incorrect use of ParentDataWidget.", //'$desc',
                              textAlign: TextAlign.justify,
                              style: new TextStyle(
                                fontFamily: 'Quicksand,sans-serif!important',
                                color: Colors.black,
                                fontSize: 17.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: dataw.size.width / 1.3,
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("មេរៀនដែលអាចជាប់ទាក់ទង៖",
                                style: TextStyle(
                                    fontSize: 17.0, fontWeight: FontWeight.w700)),
                            Container(
                              height: 210,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext ctx, int index) {
                                  return Card(
                                    child: Container(
                                      width: 300,
                                      height: 150,
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          10,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              height: 60,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  7,
                                                ),
                                                child: Image.network(
                                                  "https://www.wowmakers.com/blog/wp-content/uploads/2019/02/Video-thumbnail.jpg",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Image.network(
                                                  'https://img.icons8.com/pastel-glyph/2x/home.png',
                                                  width: 15,
                                                  height: 15,
                                                ),
                                                SizedBox(
                                                  width: 3,
                                                ),
                                                Text(
                                                  "Content Creator Guideline",
                                                  style: TextStyle(
                                                    fontSize: 13,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 7,
                                            ),
                                            Text(
                                              "បច្ចេកទេសធ្វើវិដេអូមេរៀន",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    100,
                                                  ),
                                                  child: Image.network(
                                                    "https://salabackend.koompi.com/public/uploads/avatar-88cd57f2-1524-475e-ba57-18e7fddbfa18.png",
                                                    width: 30,
                                                    height: 30,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    left: 5,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Text("KOOMPI STEAM"),
                                                      SizedBox(
                                                        height: 3,
                                                      ),
                                                      Text(
                                                          "7 views - 7 days ago",style: TextStyle(fontSize: 13)),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Container(
                                              height: 30,
                                              width: 100,
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
                                                  "100\$",
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
                                  );
                                },
                                separatorBuilder: (BuildContext ctx, int index) {
                                  return SizedBox(
                                    width: 10,
                                  );
                                },
                                itemCount: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
