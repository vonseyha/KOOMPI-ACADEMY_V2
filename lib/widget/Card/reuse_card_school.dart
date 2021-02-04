import 'package:KOOMPIACADEMY/screen/HomePage/School/orginization.dart';
import 'package:flutter/material.dart';

class ReuseCardSchool extends StatelessWidget {
  final String image;
  final String image_school;
  final String title;
  final int number_student;
  const ReuseCardSchool({
    this.image,
    this.title,
    this.image_school,
    this.number_student,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
          child: GestureDetector(
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyOrginization()));                
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
                          image
                            ),
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
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor:Colors.white30,
                            radius: 20,
                            child: CircleAvatar(
                              backgroundColor: Colors.white30,
                              backgroundImage: NetworkImage(
                                  image_school
                                  ),
                            ),
                          ),
                          title: Text(
                            title,
                            style: new TextStyle(
                              fontFamily: 'sans-serif',
                              fontWeight: FontWeight.w700,
                              fontSize: 18.0,
                            ),
                          ),
                          subtitle: Text('ចំនួនសិស្ស $number_student នាក់',
                              style: new TextStyle(
                                fontSize: 14.0,
                                color: Color(0xFF4d6890),
                              )),
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
    );
  }
}