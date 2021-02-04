import 'package:KOOMPIACADEMY/screen/LoginScreen/loginscreen.dart';
import 'package:KOOMPIACADEMY/widget/Form/reuse_materialButton.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<String> forgotpassword(String email) async {
  var response =
      await http.post("https://learnbackend.koompi.com/forgot-password", body: {
    'email': email,
  });
  print(response.statusCode);
  print(email.toString());
}

TextStyle style =
    TextStyle(fontFamily: 'Montserrat', fontSize: 17.0, color: Colors.white);
//*************** Display Dailog Forgot Password Button************//
displayDialogForgotPass(BuildContext context, String _resetemail) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          content: Container(
            height: MediaQuery.of(context).size.height / 3.2,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Text("PASSWORD UPDATED",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
                SizedBox(
                  height: 15.0,
                ),
                Image.asset(
                  "images/correctpass.png",
                  fit: BoxFit.contain,
                  height: 100.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "your password has been updated!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 7.0,
                ),
                //******Call Widget Login Button ******//
                ReuseMeterialButton(
                  evaluation: 0.5,
                  radius: 10,
                  color: Colors.black,
                  child: MaterialButton(
                    minWidth: 150,
                    height: 5,
                    splashColor: null,
                    onPressed: () {
                      //---------------------------
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginUI()));                    
                    },
                    child: Text("LOGIN",
                        textAlign: TextAlign.center,
                        style: style.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w400)),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
