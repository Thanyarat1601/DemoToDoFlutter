import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/signin_controller.dart';
import 'package:flutter_application_1/Style/style_Mywidget.dart';
import 'package:flutter_application_1/View/signup.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final SigninController signinController = SigninController();

  final _formKey =  GlobalKey<FormState>(); /// เชื่อมโยงระหว่างฟอร์มและสถานะของฟอร์ม เพื่อเป็นการตรวจสอบความถูกต้องที่ผู้ใช้กรอก

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            // ตกแต่งพื้นหลัง ใส่ background
            image: DecorationImage(
            fit: BoxFit.cover, 
              image: AssetImage("assets/background.png"),
            ),
          ),
            child: Form(
              key: _formKey,
              child: ListView(
               children: [Column(
        
                  children: [
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
                    Stylreogin(
                      "Email",
                      false,
                      controller: emailController,
                   
                    ),
                    SizedBox(height: 20),
                    Stylreogin(
                      "Password",
                      true,
                      controller: passwordController,
                  
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
                     if (_formKey.currentState!.validate()) {
                      signinController.signinUser(
                        emailController,
                        passwordController,
                        context,
                      );
                     }
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
                ),],
              ),
            ),
          // ),
        
        ),
      ),
    );
  }
}
