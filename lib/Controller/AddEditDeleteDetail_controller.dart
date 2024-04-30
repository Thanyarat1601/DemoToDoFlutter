import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/addyourtodo_model.dart';
import 'package:flutter_application_1/Model/detail_model.dart';
import 'package:http/http.dart' as http;

class AddEditDeleteDetaiController {
  final client = http.Client();
  final baseUrl = "http:/localhost:6004/api";
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
  void showSnackBar2(String text, var context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: const Color.fromARGB(255, 194, 67, 58),
          content: Text(text, style: TextStyle(color: Colors.white))),
    );
  }
  Future<int> addyourtodo(
    
    TextEditingController todoTitle,
    TextEditingController todoDesc,
    String todoList,
    int userID,
    BuildContext context,
  ) async {
      detailtodolist.clear(); 
    final json = {
      "user_todo_list_title": todoTitle.text,
      "user_todo_list_desc": todoDesc.text,
      "user_todo_list_completed": todoList,
      "user_id": userID,
    };

    final url = Uri.parse('http://localhost:6004/api/create_todo');
    final res =
        await client.post(url, body: jsonEncode(json), headers: getHeaders());

        /// ตรวจสอบสถานะการตอบกลับจากเซิร์ฟเวอร์ API     
  if (res.statusCode == 200 &&
        todoTitle.text.isNotEmpty &&
        todoDesc.text.isNotEmpty) {  /// สำเร็จถ้าค่า todoTitle และ todoDesc ไม่ว่าง (ค่าไม่ใช่ค่าว่าง)
      showSnackBar('Add Todo Complete', context);
      Navigator.pop(context);
    } else if (res.statusCode == 400 && todoTitle.text.isEmpty ||
        todoDesc.text.isEmpty) {  /// ไม่สำเร็จถ้า todoTitle หรือ todoDesc เป็นค่าว่าง 
      showSnackBar2('Add Todo Fail!!', context);
    } else {
      showSnackBar2('Database Error!.', context);
    }
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
      detailtodolist.clear(); 
    final json = {
      "user_todo_list_title": todoTitle.text,
      "user_todo_list_desc": todoDesc.text,
      "user_todo_list_completed": todoList,
      "user_todo_list_id": userTodoListId,
      "user_todo_type_id": 1,
      "user_id": userID,
    };
    log(json.toString());
     final url = Uri.parse('http://localhost4:6004/api/update_todo/');
    final res =
        await client.post(url, body: jsonEncode(json), headers: getHeaders());

    if (res.statusCode == 200) {
      showSnackBar('UPDAET SUCCESS!!', context);
      Navigator.pop(context);
    } else if (res.statusCode == 400) {
      showSnackBar2('incorrect.', context);
    } else {
      showSnackBar2('Database Error!.', context);
      log(res.statusCode.toString());
    }
    return res.statusCode;
  }

  Future<List<Detail>> deleteYourTodo(
      int userTodoListId, context) async {
    // detailtodolist.clear(); 

    final url =
     Uri.parse('http://localhost:6004/api/delete_todo/$userTodoListId');
    try {
      final res = await http.delete(url, headers: getHeaders());
      print(res.body);
      var data = jsonDecode(res.body);
      print(data); 
      print(res.statusCode); 
      if (res.statusCode == 200) {
        showSnackBar('DELETE SUCCESS!!', context);
        Navigator.pop(
            context); 
      } else if (res.statusCode == 400) {
        showSnackBar2('Incorrect.', context);
      } else {
        showSnackBar2('Database Error!', context);
        print(res.statusCode); 
      }
    } catch (e) {
      print('Error: $e'); 
      showSnackBar2('An error occurred.', context);
    }

    return detailtodolist;  // ส่งค่าคืน
  }
}
