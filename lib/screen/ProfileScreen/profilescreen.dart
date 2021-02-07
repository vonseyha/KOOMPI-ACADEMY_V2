import 'package:KOOMPIACADEMY/widget/Form/reuse_materialButton.dart';
import 'package:KOOMPIACADEMY/widget/Form/reuse_textform_feild.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:gender_selector/gender_selector.dart';

class ProfieUser extends StatefulWidget {
  @override
  _ProfieUserState createState() => _ProfieUserState();
}

class _ProfieUserState extends State<ProfieUser> {
  bool showPassword = false;
  TextEditingController controller = new TextEditingController();
  int selectedGender;
  String gender;
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0, color: Colors.white);

  DateTime pickeredDate;

  //  final TextEditingController controller = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number = PhoneNumber(isoCode: 'NG');

  @override
  void initState() {
    // TODO: implement initState
    selectedGender = 0;
    pickeredDate = DateTime.now();
    super.initState();
  }

  setSelectionRadio(int val){
    setState(() {
      selectedGender = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("User Profile",style: TextStyle(color: Colors.grey),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back , color: Colors.black87),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: SingleChildScrollView(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                Text("Gender",style: TextStyle(fontSize: 20)),
                ButtonBar(
                  alignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: 0, 
                          groupValue: selectedGender, 
                          activeColor: Colors.red,
                          onChanged: (val){
                            setSelectionRadio(val);
                            if(val == 0){
                              setState(() {
                                gender = "Femail";
                              });
                              print(gender);
                            }
                          }
                        ),
                        Text("Femail")
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value:1, 
                          groupValue: selectedGender, 
                          activeColor: Colors.blue,
                          onChanged: (val){
                            setSelectionRadio(val);
                            if(val == 1){
                              setState(() {
                                gender = "Mail";
                              });
                              print(gender);
                            }
                          }
                        ),
                        Text("Mail"),
                      ],
                    )
                  ],
                ),

              ]),
            ),
            ListTile(
            title: Text("${pickeredDate.year} , ${pickeredDate.month}, ${pickeredDate.day}"),
            trailing: Icon(Icons.date_range_outlined),
            onTap: _pickDate,
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


            InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  print(number.phoneNumber);
                },
                onInputValidated: (bool value) {
                  print(value);
                },
                selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: TextStyle(color: Colors.black),
                initialValue: number,
                textFieldController: controller,
                formatInput: false,
                keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
                inputBorder: OutlineInputBorder(),
                onSaved: (PhoneNumber number) {
                  print('On Saved: $number');
                },
              ),
            


            SizedBox(height:10),
            ReuseTextFormField(
              labelText: "ប្រវិត្តសង្ខេប",
              maxLength: 10,
              maxLine: 1,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              controller: controller,
            ),
            Text("ផ្នែកព័ត៌មានទូទៅ"),
            Divider(height: 10),
            SizedBox(height: 15),
            ReuseTextFormField(
              labelText: "ប្រវិត្តសង្ខេប",
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
              
            ),
            ReuseTextFormField(
              labelText: "ប្រវិត្តសង្ខេប",
              maxLength: 10,
              maxLine: 1,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              controller: controller,
              
            ),
            Center(
              child: ReuseMeterialButton(
                        evaluation: 0.5,
                        color: Color(0xFF4080D6),
                        radius: 30,
                        child: MaterialButton(
                          minWidth: 200,
                          splashColor: null,
                          onPressed: () {
                            // Navigator.push(context, MaterialPageRoute(builder:  (context) => HomePage()));
                          },
                          child: Text("LOGIN",
                              textAlign: TextAlign.center,
                              style: style.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
            ),
          ],
        ),
      ),
    ));
  }

  _pickDate () async{
    DateTime date = await showDatePicker(
      context: context, 
      initialDate: pickeredDate, 
      firstDate: DateTime(DateTime.now().year - 5), 
      lastDate: DateTime(DateTime.now().year + 5)
    );
    if(date != null){
      setState(() {
        pickeredDate = date;
      });
    }
  }

  Widget imageProfile() {
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
              onTap: () {
                print("Hele");
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomSheet()),
                );
              },
              child: Icon(
                Icons.camera_alt,
                color: Colors.blue,
                size: 23,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        children: [
          Text("ជ្រើសរូបភាពដំណាង", style: TextStyle(fontSize: 17)),
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
