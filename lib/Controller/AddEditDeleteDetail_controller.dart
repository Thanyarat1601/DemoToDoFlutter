import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/addyourtodo_model.dart';
import 'package:flutter_application_1/Model/detail_model.dart';
import 'package:http/http.dart' as http;

class AddEditDeleteDetaiController {
  final client = http.Client();
  final baseUrl = "http:/192.168.25.214:6004/api";
  final token = "950b88051dc87fe3fcb0b4df25eee676";
  late Detail detailtodo;
  late AddYourTodo usertodo;

  List<Detail> detailtodolist = [];

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

  Future<int> addyourtodo(
    TextEditingController todoTitle,
    TextEditingController todoDesc,
    bool todoList,
    int userID,
  ) async {
    final json = {
      "user_todo_list_title": todoTitle.text,
      "user_todo_list_desc": todoDesc.text,
      "user_todo_list_completed": todoList,
      "user_id": userID,
    };

    final url = Uri.parse('http://192.168.25.214:6004/api/create_todo');
    // final url = Uri.parse('http://localhost:6004/api/create_todo')
    final res =
        await client.post(url, body: jsonEncode(json), headers: getHeaders());

    log(res.statusCode.toString());
    return res.statusCode;
  }

  Future<int> edityourtodo(
    TextEditingController todoTitle,
    TextEditingController todoDesc,
    String todoList,
    int userID,
    int userTodoListId,
    BuildContext context,
  ) async {
    final json = {
      "user_todo_list_title": todoTitle.text,
      "user_todo_list_desc": todoDesc.text,
      "user_todo_list_completed": todoList,
      "user_todo_list_id": userTodoListId,
      "user_todo_type_id": 1,
      "user_id": userID,
    };
    log(json.toString());
    final url = Uri.parse('http://192.168.25.214:6004/api/update_todo/');
    final res =
        await client.post(url, body: jsonEncode(json), headers: getHeaders());

    if (res.statusCode == 200) {
      showSnackBar('UPDAET SUCCESS!!', context);
      Navigator.pop(context);
    } else if (res.statusCode == 400) {
      showSnackBar('incorrect.', context);
    } else {
      showSnackBar('Database Error!.', context);
      log(res.statusCode.toString());
    }
    return res.statusCode;
  }

  Future<List<Detail>> deleteYourTodo(
      int userTodoListId, BuildContext context) async {
    detailtodolist.clear(); // Clearing the list before adding new details

    final url =
        Uri.parse('http://192.168.25.214:6004/api/delete_todo/$userTodoListId');
    // Uri.parse('http://localhost:6004/api/delete_todo/$userTodoListId');
    try {
      final res = await http.delete(url, headers: getHeaders());
      print(res.body); // Log the response body for debugging
      var data = jsonDecode(res.body);
      print(data); // Log the decoded JSON for debugging
      print(res.statusCode); // Log the response status code for debugging

      if (res.statusCode == 200) {
        showSnackBar('DELETE SUCCESS!!', context);
        Navigator.pop(
            context); // Close the bottom sheet after successful deletion
      } else if (res.statusCode == 400) {
        showSnackBar('Incorrect.', context);
      } else {
        showSnackBar('Database Error!', context);
        print(res.statusCode); // Log the status code for debugging
      }
    } catch (e) {
      print('Error: $e'); // Log any errors that occur during the request
      showSnackBar('An error occurred.', context);
    }

    return detailtodolist; // Returning the list, though it's not clear if you're modifying it // ส่งค่าคืน
  }
}
