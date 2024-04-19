import 'dart:developer';
import 'package:flutter/material.dart';
// import 'package:flutter_application_1/Controller/detail_controller.dart';
// import 'package:flutter_application_1/Style/style_Mywidget.dart';
// import 'package:flutter_application_1/View/detail.dart';
import 'package:flutter_application_1/Controller/AddEditDeleteDetail_controller.dart';
// import 'package:flutter_application_1/Controller/detail_controller.dart';

class Addyourtodo extends StatefulWidget {
  final int UserID;
  final String Titeldata;
  final String Decdata;
  final bool isActive;
  final int UserTodoID;
  final String appbar;

  const Addyourtodo({
    super.key,
    required this.UserID,
    required this.isActive,
    required this.UserTodoID,
    required this.appbar,
    required this.Titeldata,
    required this.Decdata,
  });

  @override
  State<Addyourtodo> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Addyourtodo> {
  final TextEditingController TitleController = TextEditingController();
  final TextEditingController DecriptionController = TextEditingController();
  late bool Success;

  AddEditDeleteDetaiController addEditDeleteDetaiController =
      AddEditDeleteDetaiController();

  late int UserID;
  late String Titeldata;
  late String Decdata;
  late bool isActive;
  late int UserTodoID;
  late String appbar;
  late String booldata;

  @override
  void initState() {
    super.initState();
    UserID = widget.UserID;
    UserTodoID = widget.UserTodoID;
    appbar = widget.appbar;
    booldata = widget.isActive
        ? '1'
        : '0'; // กำหนดค่าให้กับ booldata ตามค่าของ isActive ที่รับมา
    if (widget.UserID != '') {
      TitleController.text = widget.Titeldata;
      DecriptionController.text = widget.Decdata;
      Success = widget.isActive;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          // ใช้ Row เพื่อรวม Text widget และ Spacer widget เข้าด้วยกัน
          children: [
            Text(
              "${appbar}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Spacer(), // Spacer จะช่วยขยับข้อความไปทางขวาสุดของ AppBar
          ],
        ),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: <Color>[
                Color(0xFF34A782),
                Color(0xFF34A782),
              ],
            ),
          ),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context); // กลับหน้า
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0), // ปรับมุม
                color: Color.fromARGB(255, 220, 218, 218),
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(21, 10, 18, 10),
        child: appbar == 'Add Your Todo'

            /// สำหรับ Add ข้อมูล
            ? Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 21,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // สีเงา
                            spreadRadius: 1, // รัศมีการกระจาย
                            blurRadius: 8, // ความเบลอ
                            offset: Offset(0, 3), // การเยื้อง
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: TitleController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: ('Title'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 140, 139, 138),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // สีเงา
                            spreadRadius: 1, // รัศมีการกระจาย
                            blurRadius: 9, // ความเบลอ
                            offset: Offset(0, 3), // การเยื้อง
                          ),
                        ],
                        // borderRadius: BorderRadius.circular(15), // ขอบโค้ง
                      ),
                      child: TextField(
                        controller: DecriptionController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintText: ('Description'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 140, 139, 138),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // กำหนดสีพื้นหลังเป็นสีขาว
                        // border: Border.all(
                        //   color: const Color.fromARGB(
                        //       255, 40, 39, 39), // กำหนดเส้นขอบ
                        // ),
                        borderRadius:
                            BorderRadius.circular(15), // กำหนดรูปร่างของขอบ
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // สีของเงา
                            spreadRadius: 2, // ระยะขยายของเงา
                            blurRadius: 7, // ความเบลอของเงา
                            offset:
                                Offset(3, 3), // การเลื่อนของเงาในแนวแกน X และ Y
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          SwitchListTile(
                            title: Text(
                              'Success',
                              style: TextStyle(color: Color(0xFF0D7A5C)),
                            ),
                            value: Success,
                            onChanged: (bool value) {
                              setState(() {
                                Success = value;
                                booldata = value
                                    ? '1'
                                    : '0'; // กำหนดค่าให้กับ booldata เมื่อมีการเปลี่ยนแปลง
                              });
                            },
                            activeColor: Colors.green,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height *
                          0.10, // ให้ความสูงของ Container เป็น 10% ของความสูงของหน้าจอ // ให้ความสูงของ Container เป็น 10% ของความสูงของหน้าจอ
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(400, 70),
                          // padding: const EdgeInsets.zero,
                          textStyle: TextStyle(
                            fontSize: 20,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                15), // ปรับขนาดเป็นขอบโค้งตามต้องการ
                          ),
                          padding: EdgeInsets
                              .zero, // เพื่อให้ Container มีขนาดเท่ากับปุ่ม
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF53CD9F), // เปลี่ยนสีตามที่ต้องการ
                                Color(0xFF0D7A5C), // เปลี่ยนสีตามที่ต้องการ
                              ],
                            ),
                            borderRadius: BorderRadius.circular(
                                15), // ปรับขนาดเป็นขอบโค้งตามต้องการ
                          ),
                          child: Container(
                            alignment:
                                Alignment.center, // จัดให้ข้อความอยู่ตรงกลาง
                            child: Text(
                              'SAVE', // ใช้ตัวแปรที่ถูกสร้างในคลาส
                              style: TextStyle(
                                color:
                                    Colors.white, // เปลี่ยนสีข้อความตามต้องการ
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          int data =
                              await addEditDeleteDetaiController.addyourtodo(
                            TitleController,
                            DecriptionController,
                            Success,
                            UserID, // ส่ง UserID ผ่านพารามิเตอร์ userID
                          );
                          log('$data');
                          if (data == 200) {
                            addEditDeleteDetaiController.showSnackBar(
                                'บันทึกข้อมูลเสร็จเรียบร้อย!!', context);
                          } else if (data == 400) {
                            addEditDeleteDetaiController.showSnackBar(
                                'บันทึกข้อมูลไม่สำเร็จ', context);
                          } else {
                            addEditDeleteDetaiController.showSnackBar(
                                'Database Error!', context);
                          }

                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              )

            /// สำหรับ Edit ข้อมูล
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 21,
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5), // สีเงา
                              spreadRadius: 1, // รัศมีการกระจาย
                              blurRadius: 8, // ความเบลอ
                              offset: Offset(0, 3), // การเยื้อง
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: TitleController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: ('Title'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 140, 139, 138),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5), // สีเงา
                              spreadRadius: 1, // รัศมีการกระจาย
                              blurRadius: 9, // ความเบลอ
                              offset: Offset(0, 3), // การเยื้อง
                            ),
                          ],
                          // borderRadius: BorderRadius.circular(15), // ขอบโค้ง
                        ),
                        child: TextField(
                          controller: DecriptionController,
                          maxLines: 5,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: ('Description'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 140, 139, 138),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // กำหนดสีพื้นหลังเป็นสีขาว
                      borderRadius:
                          BorderRadius.circular(15), // กำหนดรูปร่างของขอบ
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // สีของเงา
                          spreadRadius: 2, // ระยะขยายของเงา
                          blurRadius: 7, // ความเบลอของเงา
                          offset:
                              Offset(3, 3), // การเลื่อนของเงาในแนวแกน X และ Y
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SwitchListTile(
                          title: Text(
                            'Success',
                            style: TextStyle(color: Color(0xFF0D7A5C)),
                          ),
                          value: Success,
                          onChanged: (bool value) {
                            setState(() {
                              Success = value;
                              booldata = value
                                  ? '1'
                                  : '0'; // กำหนดค่าให้กับ booldata เมื่อมีการเปลี่ยนแปลง
                            });
                          },
                          activeColor: Colors.green,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.10, // ให้ความสูงของ Container เป็น 10% ของความสูงของหน้าจอ // ให้ความสูงของ Container เป็น 10% ของความสูงของหน้าจอ
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(400, 70),
                        // padding: const EdgeInsets.zero,
                        textStyle: TextStyle(
                          fontSize: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              15), // ปรับขนาดเป็นขอบโค้งตามต้องการ
                        ),
                        padding: EdgeInsets
                            .zero, // เพื่อให้ Container มีขนาดเท่ากับปุ่ม
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF53CD9F), // เปลี่ยนสีตามที่ต้องการ
                              Color(0xFF0D7A5C), // เปลี่ยนสีตามที่ต้องการ
                            ],
                          ),
                          borderRadius: BorderRadius.circular(
                              15), // ปรับขนาดเป็นขอบโค้งตามต้องการ
                        ),
                        child: Container(
                          alignment:
                              Alignment.center, // จัดให้ข้อความอยู่ตรงกลาง
                          child: Text(
                            'SAVE', // ใช้ตัวแปรที่ถูกสร้างในคลาส
                            style: TextStyle(
                              color: Colors.white, // เปลี่ยนสีข้อความตามต้องการ
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () async {
                        await addEditDeleteDetaiController.edityourtodo(
                            TitleController,
                            DecriptionController,
                            booldata, // ใช้ booldata ในการส่งค่า
                            UserID,
                            UserTodoID,
                            context);
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
