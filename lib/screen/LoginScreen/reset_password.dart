import 'package:KOOMPIACADEMY/screen/RegisterScreen/registerscreen.dart';
import 'package:KOOMPIACADEMY/widget/Dialog/reuse_dialog_displayforgot_pass.dart';
import 'package:KOOMPIACADEMY/widget/Form/reuse_signBtn.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController resetEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  width: 18.0,
                  height: 18.0,
                  child: Image.asset("images/backone.png", color: Colors.black),
                ),
                Container(
                  child: Text("back", style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
          Text(
            "Reset Password",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          Text(
            "Reset Password",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          TextFormField(
            controller: resetEmailController,
            decoration: new InputDecoration(
              labelText: "Email",
              fillColor: Colors.white,
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(5.0),
                borderSide: new BorderSide(),
              ),
            ),
            maxLines: 1,
            maxLength: 20,
          ),
          Container(
                                  //******Call Widget Sign up  Button ******//
            child: SignupBtn.buildSignupBtn(
                "Don't have an account?", "Sign Up", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RegisterUser())
            );
            }),
          )
        ],
      ),
    );
  }
}
