import 'dart:convert';

/// สำหรับแปลงข้อมูล JSON ให้เป็นอ็อบเจกต์ของ AddYourTodo
AddYourTodo addYourTodoFromJson(String str) =>
    AddYourTodo.fromJson(json.decode(str));

// สำหรับแปลงอ็อบเจกต์ AddYourTodo เป็นข้อมูล JSON
String addYourTodoToJson(AddYourTodo data) => json.encode(data.toJson());

class AddYourTodo {
  String userTodoListTitle;
  String userTodoListDesc;
  bool userTodoListCompleted;
  String userId;

  AddYourTodo({
    required this.userTodoListTitle,
    required this.userTodoListDesc,
    required this.userTodoListCompleted,
    required this.userId,
  });
/// สร้างอ็อบเจกต์ AddYourTodo จากข้อมูล JSON
  factory AddYourTodo.fromJson(Map<String, dynamic> json) => AddYourTodo(
        userTodoListTitle: json["user_todo_list_title"],
        userTodoListDesc: json["user_todo_list_desc"],
        userTodoListCompleted: json["user_todo_list_completed"],
        userId: json["user_id"],
      );
/// แปลงอ็อบเจกต์ AddYourTodo เป็น Map ที่มี key เป็นสตริงและ value 
  Map<String, dynamic> toJson() => {
        "user_todo_list_title": userTodoListTitle,
        "user_todo_list_desc": userTodoListDesc,
        "user_todo_list_completed": userTodoListCompleted,
        "user_id": userId,
      };
}
