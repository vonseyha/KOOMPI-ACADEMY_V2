import 'package:KOOMPIACADEMY/widget/Form/reuse_textform_feild.dart';
import 'package:flutter/material.dart';
import 'package:gender_selector/gender_selector.dart';

class ProfieUser extends StatefulWidget {
  @override
  _ProfieUserState createState() => _ProfieUserState();
}

class _ProfieUserState extends State<ProfieUser> {
  bool showPassword = false;
  TextEditingController controller = new TextEditingController();
  String selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imageProfile(),
            Text("ផ្នែកព័ត៌មានទូទៅ"),
            Divider(height: 10),
            SizedBox(height: 15),
            ReuseTextFormField(
              labelText: "គោត្តនាម និង នាមេ",
              maxLength: 10,
              maxLine: 1,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              controller: controller,
            ),
            GenderSelector(
  margin: EdgeInsets.only(left: 10, top: 30, right: 10, bottom: 10,),
  selectedGender: Gender.FEMALE,
  onChanged: (gender) async {

    setState(() {
      if(gender == Gender.FEMALE) {
        selectedGender = "female";
      } else {
        selectedGender = "male";
      }
    });

  },

),
            ReuseTextFormField(
              labelText: "សាលារៀន",
              maxLength: 10,
              maxLine: 1,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              controller: controller,
            ),
            ReuseTextFormField(
              labelText: "ទីកន្លែង",
              maxLength: 10,
              maxLine: 1,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              controller: controller,
            ),
            ReuseTextFormField(
              labelText: "ប្រវិត្តសង្ខេប",
              maxLength: 10,
              maxLine: 1,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              controller: controller,
            )
          ],
        ),
      )
    );
  }
  
  Widget imageProfile(){
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 60.0,
            backgroundImage: AssetImage("images/splash22.png"),
          ),
          Positioned(
            bottom: 10.0,
            right: 10.0,
            child: InkWell(
              onTap: (){
                print("Hele");
                showModalBottomSheet(
                  context: context, 
                  builder: ((builder) => bottomSheet()),
                );
              },
              child: Icon(
                Icons.camera_alt,
                color: Colors.blue,
                size:23,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomSheet(){
    return Container(
        height: 100.0,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
        child: Column(
          children: [
            Text("ជ្រើសរូបភាពដំណាង",style: TextStyle(fontSize: 17)),
            Divider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton.icon(
                  onPressed: null, 
                  icon: Icon(Icons.camera),
                  label: Text("Camera"),
              ),

               FlatButton.icon(
                  onPressed: null, 
                  icon: Icon(Icons.image),
                  label: Text("Gallery"),
              )
              
              ],
            )
          ],
          
        ),
    );
  }




}