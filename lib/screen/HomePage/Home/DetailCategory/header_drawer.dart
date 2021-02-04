import 'package:flutter/material.dart';
class HeaderDrawer extends StatelessWidget {
  final String image_user;
  final String name;
  final String email;
  const HeaderDrawer({
    this.image_user,
    this.name,
    this.email,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        child: Stack(children: <Widget>[
          Positioned(
            left: 70.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    100,
                  ),
                  child: Image.network(
                    image_user,
                    width: 80,
                    height: 80,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.all(
                    5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(name,textAlign: TextAlign.center,style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w700)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(email,textAlign: TextAlign.center,style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ]));
  }
}
