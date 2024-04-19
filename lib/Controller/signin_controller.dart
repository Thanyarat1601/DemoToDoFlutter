import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/signin_model.dart';
import 'package:flutter_application_1/View/detail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SigninController {
  final client = http.Client();
  final baseUrl = "http:/192.168.25.214:6004/api";
  final token = "950b88051dc87fe3fcb0b4df25eee676";
  late Signin user; //class model ของ sign in

  //set headers
  dynamic getHeaders() {
    final header = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    return header;
  }

  void showSnackBar(String text, var context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: Color.fromRGBO(13, 122, 92, 1),
          content: Text(text, style: TextStyle(color: Colors.white))),
    );
  }

  void signinUser(TextEditingController email, TextEditingController pass,
      var context) async {
    String mail = email.text;
    String passw = pass.text;
    final json = {
      "user_email": email.text,
      "user_password": pass.text,
    };
    log(json.toString());

    final url = Uri.parse('http://192.168.25.214:6004/api/login');
    // final url = Uri.parse('http://localhost:6004/api/login');

    final res =
        await client.post(url, body: jsonEncode(json), headers: getHeaders());
    log(res.body);
    var data = jsonDecode(res.body); //แปลงข้อมูล json
    print(data);

    log(res.statusCode.toString());

    if (res.statusCode == 200) {
      user = Signin.fromJson(data);
      showSnackBar('SIGN IN SUCCESS!!', context);
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('email', mail);
      pref.setString('pass', passw);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => detail(
            userdt: "${user.userFname} ${user.userLname}",
            useid: user.userId,
            // dataList: Map(),
          ),
        ),
      );
    } else if (res.statusCode == 400) {
      showSnackBar('Email or password is incorrect', context);
    } else {
      showSnackBar('Database Error!', context);
    }
  }

  void clearLogin(TextEditingController email, TextEditingController pass) {
    email.clear();
    pass.clear();
  }
}
