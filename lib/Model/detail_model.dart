import 'dart:convert';

/// สำหรับแปลงข้อมูล JSON ให้เป็นอ็อบเจกต์ของ Detail
Detail detailFromJson(String str) => Detail.fromJson(json.decode(str));

// สำหรับแปลงอ็อบเจกต์ Detail เป็นข้อมูล JSON
String detailToJson(Detail data) => json.encode(data.toJson());

class Detail {
  int userTodoListId;
  String userTodoListTitle;
  String userTodoListDesc;
  String userTodoListCompleted;
  DateTime userTodoListLastUpdate;
  int userId;


  Detail({
    required this.userTodoListId,
    required this.userTodoListTitle,
    required this.userTodoListDesc,
    required this.userTodoListCompleted,
    required this.userTodoListLastUpdate,
    required this.userId,

  });

  /// สร้างอ็อบเจกต์ Detail จากข้อมูล JSON
  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        userTodoListId: json["user_todo_list_id"],
        userTodoListTitle: json["user_todo_list_title"],
        userTodoListDesc: json["user_todo_list_desc"],
        userTodoListCompleted: json["user_todo_list_completed"],
        userTodoListLastUpdate:
            DateTime.parse(json["user_todo_list_last_update"]),
        userId: json["user_id"]
      );
/// แปลงอ็อบเจกต์ Detail เป็น Map ที่มี key เป็นสตริงและ value 
  Map<String, dynamic> toJson() => {
        "user_todo_list_id": userTodoListId,
        "user_todo_list_title": userTodoListTitle,
        "user_todo_list_desc": userTodoListDesc,
        "user_todo_list_completed": userTodoListCompleted,
        "user_todo_list_last_update": userTodoListLastUpdate.toIso8601String(),
        "user_id": userId,
   
      };
}
