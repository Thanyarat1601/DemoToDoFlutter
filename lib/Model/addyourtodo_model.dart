import 'dart:convert';
// import 'dart:ffi';

AddYourTodo addYourTodoFromJson(String str) =>
    AddYourTodo.fromJson(json.decode(str));

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

  factory AddYourTodo.fromJson(Map<String, dynamic> json) => AddYourTodo(
        userTodoListTitle: json["user_todo_list_title"],
        userTodoListDesc: json["user_todo_list_desc"],
        userTodoListCompleted: json["user_todo_list_completed"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_todo_list_title": userTodoListTitle,
        "user_todo_list_desc": userTodoListDesc,
        "user_todo_list_completed": userTodoListCompleted,
        "user_id": userId,
      };
}
