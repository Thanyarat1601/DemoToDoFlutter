import 'dart:convert';

Signin signinFromJson(String str) => Signin.fromJson(json.decode(str));

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

  factory Signin.fromJson(Map<String, dynamic> json) => Signin(
        userId: json["user_id"],
        userEmail: json["user_email"],
        userPassword: json["user_password"],
        userFname: json["user_fname"],
        userLname: json["user_lname"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_email": userEmail,
        "user_password": userPassword,
        "user_fname": userFname,
        "user_lname": userLname,
      };
}
