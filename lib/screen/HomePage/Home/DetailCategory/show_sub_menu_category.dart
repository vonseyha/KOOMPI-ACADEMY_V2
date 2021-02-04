import 'package:KOOMPIACADEMY/screen/HomePage/Home/DetailCategory/list_all_by_category.dart';
import 'package:flutter/material.dart';

class ShowSubMenuCategory extends StatefulWidget {
  @override
  _ShowSubMenuCategoryState createState() => _ShowSubMenuCategoryState();
}

class _ShowSubMenuCategoryState extends State<ShowSubMenuCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext ctx , int index){
          return ListTile(
            title: Text('កាលវិភាគ',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w600)),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              // do something
              Navigator.push(context, MaterialPageRoute(builder: (context) => ListAllCourseByCategory()));
              print("press");
            },
            onLongPress: (){
              // do something else
              Navigator.push(context, MaterialPageRoute(builder: (context) => ListAllCourseByCategory()));
              print("Logn");
            },
          );
        }
      ),  
        // body: ,s
    );
  }
}