import 'dart:convert';

/// สำหรับแปลงข้อมูล JSON ให้เป็นอ็อบเจกต์ของ Signin
Signin signinFromJson(String str) => Signin.fromJson(json.decode(str));

// สำหรับแปลงอ็อบเจกต์ Signin เป็นข้อมูล JSON
String signinToJson(Signin data) => json.encode(data.toJson());

class Signin {
  int userId;
  String userEmail;
  String userPassword;
  String userFname;
  String userLname;

  Signin({
    required this.userId,
    required this.userEmail,
    required this.userPassword,
    required this.userFname,
    required this.userLname,
  });

  /// สร้างอ็อบเจกต์ Signin จากข้อมูล JSON
  factory Signin.fromJson(Map<String, dynamic> json) => Signin(
        userId: json["user_id"],
        userEmail: json["user_email"],
        userPassword: json["user_password"],
        userFname: json["user_fname"],
        userLname: json["user_lname"],
      );
/// แปลงอ็อบเจกต์ Signin เป็น Map ที่มี key เป็นสตริงและ value 
  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_email": userEmail,
        "user_password": userPassword,
        "user_fname": userFname,
        "user_lname": userLname,
      };
}
