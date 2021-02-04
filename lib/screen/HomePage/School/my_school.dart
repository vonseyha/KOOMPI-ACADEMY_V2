import 'package:KOOMPIACADEMY/screen/HomePage/School/show_pup_pop_menu.dart';
import 'package:flutter/material.dart';

import 'orginization.dart';

class MySchool extends StatefulWidget {
  @override
  _MySchoolState createState() => _MySchoolState();
}

class _MySchoolState extends State<MySchool> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
              child: GestureDetector(
                onTap:(){
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => MyOrginization()));                
                },
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Color(0xFFc3c4c5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Image(
                            width: MediaQuery.of(context).size.width,
                            height: 150.0,
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://www.excellentwebworld.com/wp-content/uploads/2019/04/best-flutter-app-development.jpg"),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.only(
                              bottomEnd: Radius.circular(10.0),
                              bottomStart: Radius.circular(10.0)),
                          color: Colors.white70,
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.white30,
                                      radius: 30,
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          "https://i.ytimg.com/vi/fq4N0hgOWzU/maxresdefault.jpg",
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      "SALA KOOMPI",
                                      style: new TextStyle(
                                        fontFamily: 'sans-serif',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                    subtitle: Text('ចំនួនសិស្ស ៨ នាក់',
                                        style: new TextStyle(
                                          fontSize: 12.0,
                                          color: Color(0xFF4d6890),
                                        )),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: ShowPupPopMenu(),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
