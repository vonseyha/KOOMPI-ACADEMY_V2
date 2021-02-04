import 'dart:io';

import 'package:KOOMPIACADEMY/widget/Form/reuse_materialButton.dart';
import 'package:KOOMPIACADEMY/widget/Form/reuse_toastMs_top.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0, color: Colors.white);
  // bool input = true;

  //***************Select Image From Gellery Fuction**************/
  File _image;
  String imageUrl;
  Future selectImage() async {
  var image = await ImagePicker.pickImage(source: ImageSource.gallery);
  setState(() {
    _image = image;
    // decodeFile(_image);
    // ReuseUploadeImage.decodeFile(_image,imageUrl);
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("បញ្ចេញជាមតិយោបល់",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black87)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black54),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 200,
                width: 200,
                child: Center(child: SvgPicture.asset("images/comment.svg"))),
            Text("បញ្ចេញជាមតិយោបល់នៃការប្រើប្រាស់!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
            SizedBox(height: 15),
            Divider(thickness: 1, endIndent: 100, indent: 100),
            Text("តើអ្នកយល់យ៉ាងណាក្រោយពីបានធ្វើ\nការប្រើប្រាស់ SALA KOOMPI?",
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.w600)),
            Container(
              padding: EdgeInsets.all(20.0),
              child: TextField(
                maxLines: 3,
                maxLength: 500,
                decoration: InputDecoration(
                  labelText: "ខ្ញុំយល់ថា...",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(8.0),
                    borderSide: new BorderSide(),
                  ),
                ),
              ),
            ),
            
            GestureDetector(
              onTap: (){
                selectImage();
              },
              child: Container(
                height: MediaQuery.of(context).size.width / 15,
                width:  MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                  color: Colors.white,//Color(0xFFff6666),
                  borderRadius: BorderRadius.circular(20), 
                  border: Border.all(
                    color:Color(0xFFff6666),
                    width: 2

                  )
                ),
                child: Center(
                  child: Text(
                    "ខ្ញុំត្រូវការបញ្ចូលរូបភាព",
                    textAlign:TextAlign.center,
                    style: TextStyle(color: Color(0xFFff4d4d))
                  ),
                )
              ),

            ),
          Container(
          child: _image != null ?
                 ReuseToastMessageTop.toastMessage(
                   "បញ្ចូលរូបភាពរួចរាល់", 
                   Colors.blue, 
                   Colors.white,
                  )
                 :  null,
                //  ReuseToastMessageTop.toastMessage(
                  //  "មិនទាន់បញ្ចូលរូបភាព", 
                  //  Colors.blue, 
                  //  Colors.white,
                  // ),
        ),
            SizedBox(height: 30),
            ReuseMeterialButton(
              evaluation: 0.5,
              // color: Color(0xFF4080D6),
              radius: 30,
              color: Colors.blue,
              child: MaterialButton(
                minWidth: 300,
                splashColor: null,
                onPressed: () {
                },
                child: Text("រួចរាល់",
                    textAlign: TextAlign.center,
                    style: style.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w400)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
