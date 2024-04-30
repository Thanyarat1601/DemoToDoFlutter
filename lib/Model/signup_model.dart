import 'dart:convert';

/// สำหรับแปลงข้อมูล JSON ให้เป็นอ็อบเจกต์ของ SignupModel
SignupModel signupModelFromJson(String str) =>
    SignupModel.fromJson(json.decode(str));

// สำหรับแปลงอ็อบเจกต์ SignupModel เป็นข้อมูล JSON
String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
  String userEmail;
  String userPassword;
  String userFname;
  String userLname;

  SignupModel({
    required this.userEmail,
    required this.userPassword,
    required this.userFname,
    required this.userLname,
  });

  /// สร้างอ็อบเจกต์ SignupModel จากข้อมูล JSON
 factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        userEmail: json["user_email"],
        userPassword: json["user_password"],
        userFname: json["user_fname"],
        userLname: json["user_lname"],
      );

/// แปลงอ็อบเจกต์ SignupModel เป็น Map ที่มี key เป็นสตริงและ value 
  Map<String, dynamic> toJson() => {
        "user_email": userEmail,
        "user_password": userPassword,
        "user_fname": userFname,
        "user_lname": userLname,
      };
}
