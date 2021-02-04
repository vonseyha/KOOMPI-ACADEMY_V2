import 'package:flutter/material.dart';

class ShowPupPopMenu extends StatefulWidget {
  @override
  _ShowPupPopMenuState createState() => _ShowPupPopMenuState();
}
enum MyPupopMenu { delete, edit }
class _ShowPupPopMenuState extends State<ShowPupPopMenu> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: PopupMenuButton<MyPupopMenu>(
        onSelected: (MyPupopMenu result) {
          if (result == MyPupopMenu.delete) {
            print("បានលុប");
          } else if (result == MyPupopMenu.edit) {
            print("បានកែប្រែ");
          }
        },
        icon: Icon(Icons.more_vert, color: Colors.grey),
        itemBuilder: (BuildContext context) => <PopupMenuEntry<MyPupopMenu>>[
          PopupMenuItem<MyPupopMenu>(
            value: MyPupopMenu.delete,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.delete, size: 25, color: Colors.grey),
                  SizedBox(width: 3),
                  Text("លុប"),
                ],
              ),
            ),
          ),
          PopupMenuItem<MyPupopMenu>(
            value: MyPupopMenu.edit,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                children: <Widget>[
                  Icon(Icons.edit, size: 25, color: Colors.grey),
                  SizedBox(width: 3),
                  Text("កែតម្រូវ"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}