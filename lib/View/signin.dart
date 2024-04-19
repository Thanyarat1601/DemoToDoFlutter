import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/signin_controller.dart';
// import 'package:flutter_application_1/Model/signin_model.dart';
import 'package:flutter_application_1/Style/style_Mywidget.dart';
// import 'package:flutter_application_1/View/detail.dart';
import 'package:flutter_application_1/View/signup.dart';
// import 'package:flutter_application_1/View/signin.dart';
import 'package:flutter_application_1/main.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:passwordfield/passwordfield.dart';

// import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final SigninController signinController = SigninController();
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // สร้าง GlobalKey<FormState>

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(), // สร้าง AppBar
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            // ตกแต่งพื้นหลัง ใส่ background
            image: DecorationImage(
              image: AssetImage("assets/background.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.start, // กำหนดwidget ให้อยู่ตรงไหนในหน้า

              children: <Widget>[
                SizedBox(
                  height: 59,
                ),
                Text(
                  'SIGN IN',
                  style: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('Please enter the information'),
                Text('below to access.'),
                SizedBox(height: 35),
                Image(
                  image: AssetImage("assets/iconSigin.png"),
                  width: 98,
                  height: 98,
                ),
                SizedBox(height: 34),
                Stylrlogin(
                  "Email",
                  false,
                  controller: emailController,
                  validator: MultiValidator([
                    RequiredValidator(errorText: "Email is required"),
                    EmailValidator(errorText: "Enter a valid email address")
                  ]),
                ),
                SizedBox(height: 20),
                Stylrlogin(
                  "Password",
                  true,
                  controller: passwordController,
                  validator:
                      RequiredValidator(errorText: "Password is required"),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 45, 40),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'Forgot Password ?',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                button("SIGN IN", onPressed: () {
                  // bool isValid = _formKey.currentState!.validate();
                  // if (isValid) {
                  signinController.signinUser(
                    emailController,
                    passwordController,
                    context,
                  );
                }
                    // },
                    ),
                SizedBox(height: 19),
                button(
                  "SIGN UP",
                  onPressed: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Signup()))
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
