import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/signup_controller.dart';
import 'package:flutter_application_1/Style/style_Mywidget.dart';
import 'package:flutter_application_1/View/detail.dart';
import 'package:flutter_application_1/View/signin.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();

  final SignupController signupController = SignupController();
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // สร้าง GlobalKey<FormState>
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   child: Icon(Icons.add),
        // ),
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
                    child: Form(
                  key: _formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment
                          .start, // กำหนดwidget ให้อยู่ตรงไหนในหน้า
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage("assets/Frame.png"),
                          )),
                        ),
                        SizedBox(
                          height: 59,
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(15, 8, 30, 8),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(10.0), // ปรับมุม
                                color: Color.fromARGB(255, 199, 239, 225),
                              ),
                              child: IconButton(
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: Color(0xFF3CB189),
                                ),
                                onPressed: () => Navigator.pop(context
                                    // MaterialPageRoute(
                                    //   builder: (context) => LoginScreen(),
                                    // ),
                                    ),
                              ),
                            ),
                            SizedBox(
                              width: 75,
                            ),
                            Text(
                              'SIGN UP',
                              style: TextStyle(
                                // color: Color.fromARGB(255, 57, 56, 56)
                                fontFamily: 'OpenSans',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text('Please enter the information'),
                        Text('below to access.'),
                        SizedBox(height: 35),
                        Image(
                          image: AssetImage("assets/ionSignup.png"),
                          width: 98,
                          height: 98,
                        ),
                        SizedBox(
                          height: 38,
                        ),
                        Stylrlogin(
                          "First name",
                          false,
                          controller: firstnameController,
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: "Please enter your first name"),
                          ]),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Stylrlogin(
                          "Last name",
                          false,
                          controller: lastnameController,
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: "Please enter your last name"),
                          ]),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Stylrlogin(
                          "Email",
                          false,
                          controller: emailController,
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Email is required"),
                            EmailValidator(
                                errorText: "Enter a valid email address"),
                          ]),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Stylrlogin(
                          "Password",
                          true,
                          controller: passwordController,
                          validator: MultiValidator([
                            MinLengthValidator(5,
                                errorText:
                                    "Password must be at least 5 characters long"),
                          ]),
                        ),
                        SizedBox(height: 58),
                        button(
                          "SAVE",
                          onPressed: () {
                            // Validate all text fields
                            bool isValid = _formKey.currentState!.validate();

                            if (isValid) {
                              // Perform signup process if all fields are valid
                              signupController.signupUser(
                                emailController,
                                passwordController,
                                firstnameController,
                                lastnameController,
                                context,
                              );

                              // Close the current screen after signing up
                              Navigator.pop(context);
                            }
                          },
                        ),
                      ]),
                )))));
  }
}
