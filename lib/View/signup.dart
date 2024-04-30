import 'package:flutter/material.dart';  /// ที่ใช้สร้าง UI
import 'package:flutter_application_1/Controller/signup_controller.dart';
import 'package:flutter_application_1/Style/style_Mywidget.dart'; /// เพื่อเรีกใช้ Widget , Stylrlogin และ button
class Signup extends StatelessWidget {
  Signup({super.key});
     /// รับข้อมูลจากผู้ใช้ที่กรอกลงในฟอร์ม
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();

  final SignupController signupController = SignupController();
  final _formKey =  GlobalKey<FormState>(); /// เชื่อมโยงระหว่างฟอร์มและสถานะของฟอร์ม เพื่อเป็นการตรวจสอบความถูกต้องที่ผู้ใช้กรอก
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          body: Container(
              decoration: BoxDecoration(
                // ตกแต่งพื้นหลัง ใส่ background
                image: DecorationImage(
                  image: AssetImage("assets/background.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: ListView(
                children: [Column(
                  children:[ Center(
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
                            height: 20,
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
                          Stylreogin(
                            "First name",
                            false,
                            controller: firstnameController,
                   
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Stylreogin(
                            "Last name",
                            false,
                            controller: lastnameController,
                       
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Stylreogin(
                            "Email",
                            false,
                            controller: emailController,
                 
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Stylreogin(
                            "Password",
                            true,
                            controller: passwordController,
                       
                          ),
                          SizedBox(height: 58),
                          button(
                            "SAVE",
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                /// ส่งข้อมูล TextEditingController ไปให้ signupUser 
                                signupController.signupUser(
                                  emailController,
                                  passwordController,
                                  firstnameController,
                                  lastnameController,
                                  context,
                                );
                              }
                            },
                          ),
                        ]),
                  )
                  ),
                  ],
                ),
                ],
              )
              )
                  ),
    );
  }
}
