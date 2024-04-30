import 'dart:convert';  /// แปลงข้อมูลระหว่างรูปแบบ JSON และ Object ของ 
import 'dart:developer'; /// log 
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/signin_model.dart';
import 'package:flutter_application_1/View/detail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SigninController {
  final client = http.Client();
  final baseUrl = "http://localhost:6004/api";
  final token = "950b88051dc87fe3fcb0b4df25eee676";
  late Signin user; //class model ของ sign in ประกาศใช้ late เพื่อกำหนดค่าภายหลัง (เมื่อมีการเข้าสู่ระบบสำเร็จแล้ว ข้อมูลผู้ใช้จะถูกเก็บไว้ในตัวแปร) 

  //set headers
  dynamic getHeaders() {
    final header = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    return header;
  }
     // แสดงข้อความเตือนผิดพลาด
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

  void signinUser(TextEditingController email, TextEditingController pass,
      var context) async {
    final json = {
       /// สร้าง JSON object ที่มี key-value pairs 
      "user_email": email.text,
      "user_password": pass.text,
    };
    log(json.toString());

    ///เพื่อแปลง URL string ให้กลายเป็น URI object ซึ่งสามารถใช้ในการสร้าง HTTP request ได้ 
    final url = Uri.parse('http://localhost:6004/api/login');

    final res =
        await client.post(url, body: jsonEncode(json), headers: getHeaders());
    log(res.body);
    var data = jsonDecode(res.body); //แปลงข้อมูล JSON จาก body ของ response เป็น Object ของ Dart
    print(data);

    log(res.statusCode.toString());

    /// ตรวจสอบสถานะการตอบกลับจากเซิร์ฟเวอร์ API
    if (res.statusCode == 200) {
      user = Signin.fromJson(data);
      showSnackBar('SIGN IN SUCCESS!!', context);
      SharedPreferences pref = await SharedPreferences.getInstance();  //SharedPreferences เพื่อให้สามารถใช้งานได้ในครั้งถัดไปโดยไม่ต้องเข้าสู่ระบบใหม่
      pref.setString('email', email.text);
      pref.setString('pass', pass.text);
      /// ถ้าล็อกอินสำเร็จ ให้push ไปหน้า class detail (userdtและuseidที่ถูกส่งไปยังหน้าdetail)
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => detail(
            userdt: "${user.userFname} ${user.userLname}", 
            userID: user.userId,
          ),
        ),
       
      );
    } else if (res.statusCode == 400) {
      showSnackBar2('Email or password is incorrect', context);
    } else {
      showSnackBar2('Database Error!', context);
    }
  }
}
