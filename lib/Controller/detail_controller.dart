import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/detail_model.dart';
import 'package:http/http.dart' as http;

class DetailTodoController {
  final client = http.Client();
  final baseUrl = "http:/localhost:6004/api";
  final token = "950b88051dc87fe3fcb0b4df25eee676";
  late Detail detailtodo; //class model ของ datail

  List<Detail> detailtodolist = [];

  final int userId; // เพิ่มตัวแปร userId

  DetailTodoController(this.userId); //รับค่า userId

  void showSnackBar(String text, var context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          duration: Duration(seconds: 1),
          backgroundColor: Color.fromRGBO(13, 122, 92, 1),
          content: Text(text, style: TextStyle(color: Colors.white))),
    );
  }

  Future<List<Detail>> getdataTodo(
  ) async {
    detailtodolist.clear();
    final url = Uri.parse('http://localhost:6004/api/todo_list/$userId');

    final res = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    });
    // log(res.body);
    var data = jsonDecode(res.body);
    for (var i in data) {
      detailtodolist.add(Detail.fromJson(i));
      // log('data${detailtodolist}');
    }
    // เรียงลำดับข้อมูลโดยใช้เวลาที่ทำการสร้างข้อมูล (userTodoListLastUpdate) ให้สิ่งที่สร้างเร็วที่สุดอยู่ข้างบน
  detailtodolist.sort((a, b) => b.userTodoListLastUpdate.compareTo(a.userTodoListLastUpdate));
    return detailtodolist;
  }
}
