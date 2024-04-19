import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
// import 'package:flutter_application_1/Model/signin_model.dart';
// import 'package:flutter_application_1/View/detail.dart';
import 'package:flutter_application_1/Model/signup_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SignupController {
  final client = http.Client();
  final baseUrl = "http:/192.168.25.214:6004/api";
  final token = "950b88051dc87fe3fcb0b4df25eee676";
  late SignupModel user; //class model ของ sign up

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

  void signupUser(
      TextEditingController email,
      TextEditingController pass,
      TextEditingController firstname,
      TextEditingController lastname,
      var context) async {
    String mail = email.text;
    String passw = pass.text;
    String fname = firstname.text;
    String lname = lastname.text;
    final json = {
      "user_email": email.text,
      "user_password": pass.text,
      "user_fname": firstname.text,
      "user_lname": lastname.text,
    };
    log(json.toString());

    final url = Uri.parse('http://192.168.25.214:6004/api/create_user');

    final res =
        await client.post(url, body: jsonEncode(json), headers: getHeaders());
    log(res.body);
    var data = jsonDecode(res.body); //แปลงข้อมูล json
    print(data);

    log(res.statusCode.toString());

    if (res.statusCode == 200) {
      showSnackBar('SIGN UP SUCCESS!!', context);
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString('email', mail);
      pref.setString('pass', passw);
      pref.setString('firstname', fname);
      pref.setString('lastname', lname);
    } else if (res.statusCode == 400) {
      showSnackBar('บันทึกข้อมูลไม่สำเร็จ', context);
    } else {
      showSnackBar('Database Error!', context);
    }
  }

  void clearLogin(TextEditingController email, TextEditingController pass,
      TextEditingController firstname, TextEditingController lastname) {
    email.clear();
    pass.clear();
    firstname.clear();
    lastname.clear();
  }
}
