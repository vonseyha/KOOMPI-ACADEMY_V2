import 'package:KOOMPIACADEMY/screen/RegisterScreen/registerscreen.dart';
import 'package:KOOMPIACADEMY/widget/Dialog/reuse_dialog_displayforgot_pass.dart';
import 'package:KOOMPIACADEMY/widget/Form/reuse_materialButton.dart';
import 'package:KOOMPIACADEMY/widget/Form/reuse_signBtn.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController resetEmailController = TextEditingController();
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(icon: Icon(Icons.arrow_back,color: Colors.black,), onPressed: (){Navigator.pop(context);}),
              ),
            ],
          ),
          Image.asset(
            "images/forgetpass.png",
            fit: BoxFit.contain,
            height: 170.0,
          ),
          Text(
            "FORGET PASSWORD",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          SizedBox(height:10.0),
          Text(
            "Provide your account's email for which you want\n to reset your password!",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          SizedBox(height:5.0),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: resetEmailController,
              decoration: new InputDecoration(
                labelText: "Email",
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.email),
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(5.0),
                  borderSide: new BorderSide(),
                ),
              ),
              maxLines: 1,
              maxLength: 20,
            ),
          ),
           //******Call Widget Login Button ******//
          ReuseMeterialButton(
            evaluation: 0.5,
            // color: Color(0xFF4080D6),
            radius: 10,
            color: Colors.black,
            child: MaterialButton(
              minWidth: 300,
              splashColor: null,
              onPressed: () {
               //---------------------------
               displayDialogForgotPass(context,"EMail");
              },
              child: Text("NEXT",
                  textAlign: TextAlign.center,
                  style: style.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      ),
    );
  }
}
