import 'package:KOOMPIACADEMY/widget/Card/reuse_card_school.dart';
import 'package:flutter/material.dart';

import 'orginization.dart';

class JoinSchool extends StatefulWidget {
  @override
  _JoinSchoolState createState() => _JoinSchoolState();
}

class _JoinSchoolState extends State<JoinSchool> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ReuseCardSchool(
          image: "https://i2.wp.com/aspgems.com/wp-content/uploads/2020/01/flutter-dart.png?fit=1200%2C600&ssl=1",
          image_school: "https://i.ytimg.com/vi/fq4N0hgOWzU/maxresdefault.jpg",
          title: "SALA KOOMPI",
          number_student: 8,
        ),
      ),
    );
  }
}
