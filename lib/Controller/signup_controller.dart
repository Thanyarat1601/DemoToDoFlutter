import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/signup_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SignupController {
  final client = http.Client(); /// ส่งและรับข้อมูลจากเชิร์ฟเวอร์ด้วย Http (http package)
  final baseUrl = "http:/localhost:6004/api"; 
  final token = "950b88051dc87fe3fcb0b4df25eee676"; /// การตรวจสอบและอนุญาตการเข้าถึง API
  late SignupModel user; 

  //set headers
  dynamic getHeaders() {
    final header = {
      'Authorization': 'Bearer $token', /// การอนุญาตการเข้าถึง API โดยใช้ token ที่มีประเภทเป็น 'Bearer'.
      'Content-Type': 'application/json', /// ส่งข้อมูลประเภท Json
    };

    return header;   /// คืนค่าตัวแปรซึ่งเป็น Map
  }

  void showSnackBar(String text, var context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: Color.fromRGBO(13, 122, 92, 1),
          content: Text(text, style: TextStyle(color: Colors.white))),
    );
  }
      void showSnackBar2(String text, var context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: const Color.fromARGB(255, 194, 67, 58),
          content: Text(text, style: TextStyle(color: Colors.white))),
    );
  }


  void signupUser(
    /// รับพารามิเตอร์
      TextEditingController email,
      TextEditingController pass,
      TextEditingController firstname,
      TextEditingController lastname,
      var context) async {
    /// ดึงข้อมูลจาก TextEditingController และเก็บไว้ในตัวแปร
    String mail = email.text;
    String passw = pass.text;
    String fname = firstname.text;
    String lname = lastname.text;
    final json = {
      /// สร้าง JSON object ที่มี key-value pairs 
      "user_email": email.text,
      "user_password": pass.text,
      "user_fname": firstname.text,
      "user_lname": lastname.text,
    };
    log(json.toString());

     final url = Uri.parse('http://localhost:6004/api/create_user');
       /// ใช้ await เพื่อรอให้คำขอเสร็จสมบูรณ์ และเก็บคำตอบลงในตัวแปร res.
    final res =
        await client.post(url, body: jsonEncode(json), headers: getHeaders());
    log('res ${res.body}');
    log('res ${res.statusCode}');
     
     /// ตรวจสอบสถานะการตอบกลับจากเซิร์ฟเวอร์ API
    if (res.statusCode == 200) {
      showSnackBar('SIGN UP SUCCESS!!', context);
      Navigator.pop(context);         
    } else if (res.statusCode == 400) {
      showSnackBar2('Failed to register information', context);
    } else {
      showSnackBar2('Database Error!', context);
    }
  }

}
