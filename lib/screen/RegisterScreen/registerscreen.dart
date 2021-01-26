import 'package:KOOMPIACADEMY/screen/LoginScreen/loginscreen.dart';
import 'package:KOOMPIACADEMY/widget/Form/reuse_materialButton.dart';
import 'package:KOOMPIACADEMY/widget/Form/reuse_signBtn.dart';
import 'package:KOOMPIACADEMY/widget/Form/reuse_textform.dart';
import 'package:KOOMPIACADEMY/widget/Form/reuse_textform_fill.dart';
import 'package:KOOMPIACADEMY/widget/Form/reuse_toastMs_top.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class RegisterUser extends StatefulWidget {
  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {

   final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  String email;
  String password;
  String username;

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  bool _isHidePassword = true;

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0, color: Colors.white);

//----------------------------- Client Section Display HomePage -----------------------//
ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    cache: InMemoryCache(),
    link: HttpLink(uri: 'https://learnbackend.koompi.com/student'),
  ),
);

  //----------------------------- Register -----------------------//
String CREATE_USER = """
  mutation(
    \$fullname: String!, 
    \$email: String!,
    \$password: String!
    ) {
    create_user(
      fullname: \$fullname, 
      email: \$email, 
      password: \$password
      ) {
      fullname
      email
      role {
        title
      }
    }
  }
""";

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
    client: client,
    child: Scaffold(
      body: Mutation(
          options: MutationOptions(
            document: CREATE_USER,
            update: (Cache cache, QueryResult result) {
              if (!result.hasException) {
                ReuseToastMessageTop.toastMessage(
                    "Register Sucessfuly.", Color(0xFF4080D6), Colors.white);
                usernameController.clear();
                emailController.clear();
                passController.clear();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => LoginUI()));
              } else {
                ReuseToastMessageTop.toastMessage(
                    "Error: Email is already in use.",
                    Colors.red,
                    Colors.white);
              }
              return result;
            },
          ),
          builder: (RunMutation runMutation, QueryResult result) {
            return Container(
              child: Container(
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
                              controller: usernameController,
                              hintText: 'Full Name',
                              prefixIcon:Icon(Icons.child_care, color: Colors.white70),
                              validator: (val) {
                                if (val.length == 0)
                                  return "Please enter fullname";
                                else if (!val.contains(""))
                                  return "Please enter space after last name";
                                else
                                  return null;
                              },
                              onsaved: (val) => username = val,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          //******Call Widget Password Full Form ******//
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: ResuseFormFieldEmail(
                              style: style,
                              controller: emailController,
                              hintText: 'Email',
                              prefixIcon: Icon(Icons.alternate_email,
                                  color: Colors.white70),
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
                          SizedBox(
                            height: 5.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ResuseFormFields(
                              obscureText: _isHidePassword,
                              controller: passController,
                              style: style,
                              hintText: "Password",
                              prefixIcon: Icon(Icons.lock, color: Colors.white70),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isHidePassword ^= true;
                                  });
                                },
                                child: Icon(
                                  _isHidePassword
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
                          //******Call Widget Login Button ******//
                          SizedBox(
                            height: 15.0,
                          ),
                          //******Call Widget Sign Up button ******//
                          ReuseMeterialButton(
                            evaluation: 0.0,
                            color: Color(0xFF4080D6),
                            child: MaterialButton(
                              minWidth: 200.0,
                              splashColor: null,
                              onPressed: () {
                                if (formKey.currentState.validate()) {
                                  formKey.currentState.save();
                                  runMutation({
                                    'fullname': username,
                                    'email': email,
                                    'password': password,
                                  });
                                }
                              },
                              child: Text("SIGN UP",
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
                                    //******Call Widget Login button ******//
                                    child: SignupBtn.buildSignupBtn(
                                        "Already have account?", 'Login here',
                                        () {
                                  Navigator.pop(context);
                                })),
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
              ),
            );
          }),
      )    
    );
  }
}
