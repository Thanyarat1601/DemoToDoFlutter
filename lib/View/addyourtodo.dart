import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controller/AddEditDeleteDetail_controller.dart';
import 'package:flutter_application_1/Model/detail_model.dart';
import 'package:flutter_application_1/Style/style_Mywidget.dart';

class Addyourtodo extends StatefulWidget {
  Detail? datailList;
  String appBar;
  int UserID;

   Addyourtodo({
    super.key,
    required this.datailList,
    required this.appBar,
    required this.UserID
  });

  @override
  State<Addyourtodo> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Addyourtodo> {
  final TextEditingController TitleController = TextEditingController();
  final TextEditingController DecriptionController = TextEditingController();
  late String Success; 
  // late int UserTodoListID;
  // late int UserID;

  final _formKey = GlobalKey<FormState>(); /// เชื่อมโยงระหว่างฟอร์มและสถานะของฟอร์ม เพื่อเป็นการตรวจสอบความถูกต้องที่ผู้ใช้กรอก

  AddEditDeleteDetaiController addEditDeleteDetaiController = AddEditDeleteDetaiController();

 

  @override
  void initState() {
    super.initState();
    if (widget.datailList != null ) {
      TitleController.text = widget.datailList!.userTodoListTitle;
      DecriptionController.text = widget.datailList!.userTodoListDesc;
      Success = widget.datailList!.userTodoListCompleted;
      // UserTodoListID = widget.datailList!.userTodoListId;
      // UserID = widget.datailList!.userId;
    } 
    else {
      Success = '';
      // UserID = widget.UserID;
    }
  
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            // ใช้ Row เพื่อรวม Text widget และ Spacer widget เข้าด้วยกัน
            children: [
              Text(
                "${widget.appBar}",
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
          child: widget.appBar == 'Add Your Todo'
      
              /// สำหรับ Add ข้อมูล ///
              ? Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 21,
                        ),
                        TitleTextwidget(
                          Controller: TitleController,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DescriptionTextwidget(
                          Controller: DecriptionController,
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
                                offset: Offset(
                                    3, 3), // การเลื่อนของเงาในแนวแกน X และ Y
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
                                value: Success == '1' ? true : false,
                                onChanged: (value) {
                                  setState(() {
                                    value == true
                                  ? Success = '1'
                                  : Success = '0';
                                        // กำหนดค่าให้กับ booldata เมื่อมีการเปลี่ยนแปลง
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
                                    Color(0xFF53CD9F),
                                    Color(0xFF0D7A5C),
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
                                    color: Colors
                                        .white, // เปลี่ยนสีข้อความตามต้องการ
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                int data = await addEditDeleteDetaiController
                                    .addyourtodo(
                                        TitleController,
                                        DecriptionController,
                                        Success,
                                        widget.UserID,
                                        context // ส่ง UserID ผ่านพารามิเตอร์ userID
                                        );
                              }
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                )
      
              /// สำหรับ Edit ข้อมูล ///
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 21,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TitleTextwidget(
                            Controller: TitleController,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          DescriptionTextwidget(
                            Controller: DecriptionController,
                          ),
                        ],
                      ),
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
                             value: Success == '1' ? true : false,
                                onChanged: (value) {
                                  setState(() {
                                    value == true
                                  ? Success = '1'
                                  : Success = '0';
                                        // กำหนดค่าให้กับ booldata เมื่อมีการเปลี่ยนแปลง
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
                          if (_formKey.currentState!.validate()) {
                            await addEditDeleteDetaiController.edityourtodo(
                                TitleController,
                                DecriptionController,
                                Success,
                                widget.UserID,
                                widget.datailList!.userTodoListId,
                                context);
                     
                          }
                        },
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
