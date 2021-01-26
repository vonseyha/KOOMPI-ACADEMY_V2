
import 'package:KOOMPIACADEMY/screen/LoginScreen/reset_password.dart';
import 'package:KOOMPIACADEMY/screen/RegisterScreen/registerscreen.dart';
import 'package:KOOMPIACADEMY/widget/Form/reuse_materialButton.dart';
import 'package:KOOMPIACADEMY/widget/Form/reuse_signBtn.dart';
import 'package:KOOMPIACADEMY/widget/Form/reuse_textform.dart';
import 'package:KOOMPIACADEMY/widget/Form/reuse_textform_fill.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(LoginUI());
}

class LoginUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login UI',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

final blueColor = Color(0XFF5e92f3);
final yellowColor = Color(0XFFfdd835);
final formKey = GlobalKey<FormState>();
final scaffoldKey = GlobalKey<ScaffoldState>();
TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0, color: Colors.white);

String email;
String password;
String resetemail;

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  TapGestureRecognizer _tapGestureRecognizer;
  bool _passwordVisible = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  //*************** Remember check box************//
  bool get rememberMe => _isRembemerMe;
  bool _isRembemerMe = false;

  Widget remberMeCheckBox() {
    return CheckboxListTile(
      checkColor: Theme.of(context).primaryColor,
      activeColor: Colors.white,
      value: _isRembemerMe,
      onChanged: handleRememberMe,
      title: Text(
        "Remember me",
        style: TextStyle(color: Colors.black54),
      ),
      controlAffinity: ListTileControlAffinity.leading,
    );
  }

  void handleRememberMe(bool value) {
    print("Handle Rember Me");
    _isRembemerMe = value;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", value);
      },
    );
    setState(() {});
  }

  void loadUserEmail() async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
       email = _prefs.getString("saved_email") ?? "";
      var _remeberMe = _prefs.getBool("remember_me") ?? false;
      if (_remeberMe) {
        emailController.text = email ?? "";
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        padding: EdgeInsets.only(top: 40.0),
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/background.jpg"),
                  fit: BoxFit.cover)),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
                child: Column(
                  children: [
                     SizedBox(
                      height: 170.0,
                      width: 170.0,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: Image.asset(
                          "images/koompi_splash.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    //******Call Widget Email Full Form ******//
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ResuseFormFieldEmail(
                          style: style,
                          controller: emailController,
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.alternate_email, color: Colors.white70),
                          validator: (val) {
                          if (val.length == 0)
                              return "Please enter email";
                            else if (!val.contains("@"))
                              return "Please enter valid email";
                            else
                              return null;
                          },
                          onsaved: (val) => email = val,
                        ),
                      ),
                       //******Call Widget Password Full Form ******//
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ResuseFormFields(
                          obscureText: _passwordVisible,
                          controller: passController,
                          style: style, 
                          hintText: "Password",
                          prefixIcon: Icon(Icons.lock_outline, color: Colors.white70),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _passwordVisible ^= true;
                              });
                            },
                            child: Icon(
                              _passwordVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          validator: (val) {
                            if (val.length == 0)
                              return "Please enter password";
                            else if (val.length <= 5)
                              return "Your password should be more then 6 char long";
                            else
                              return null;
                          },
                          onsaved: (val) => password = val,
                      ),
                      ),
                      SizedBox(
                      height: 5.0,
                    ),
                    remberMeCheckBox(),
                    SizedBox(
                      height: 05.0,
                    ),
                    //******Call Widget Login Button ******//
                    ReuseMeterialButton(
                      evaluation: 0.5,
                      color: Color(0xFF4080D6),
                      child: MaterialButton(
                        minWidth: 200,
                        splashColor: null,
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            formKey.currentState.save();
                            // login(_email, _password, context);
                          }
                        },
                        child: Text("LOGIN",
                            textAlign: TextAlign.center,
                            style: style.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 35.0,
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
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
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          
                        ],
                      ),
                    )
                  ],
            ),
          ),
        ),          
      ),
    );    
  } 
}
