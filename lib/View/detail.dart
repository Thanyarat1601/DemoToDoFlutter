import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Controller/detail_controller.dart';
import 'package:flutter_application_1/Model/detail_model.dart';
import 'package:flutter_application_1/View/addyourtodo.dart';
import 'package:flutter_application_1/Style/style_Mywidget.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_1/Controller/AddEditDeleteDetail_controller.dart';

class detail extends StatefulWidget {
  final String userdt;
  final int useid;

  detail({
    super.key,
    required this.userdt,
    required this.useid,
  });

  @override
  State<detail> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<detail> {
  late String userdt;
  late int useid;
  late DetailTodoController detailTodoController;
  final search = TextEditingController();

  AddEditDeleteDetaiController addEditDeleteDetailController =
      AddEditDeleteDetaiController();
  @override
  void initState() {
    super.initState();
    userdt = widget.userdt;
    useid = widget.useid;

    detailTodoController = DetailTodoController(
      useid,
    ); // สร้าง instance ของ Controller โดยส่งค่า useid เข้าไป
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color(0xFF53CD9F),
                  Color(0xFF0D7A5C),
                ],
              ),
            ),
          ),
          leading: GestureDetector(
            onTap: () {
              showModalBottomSheet<void>(
                backgroundColor: Color(0xFFFFFFFF),
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 251,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(
                            left: 175,
                            top: 42,
                          )),
                          Text(
                            'SIGN OUT',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Text('Do you want log out?',
                                style: TextStyle(fontSize: 16)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 25,
                              right: 25,
                            ),
                            child: StyleMyBottomSheet(
                              "Signout",
                              Icons.logout_outlined,
                              200,
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: CircleAvatar(
                backgroundColor: Color(0xFFFFFFFF),
                child: Text(
                  userdt[0].toUpperCase(),
                  style: TextStyle(color: Color(0xFF53CD9F), fontSize: 24),
                ),
              ),
            ),
          ),
          title: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Hello!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Container(
                      width: 320, // กำหนดความกว้างของ Container ตามต้องการ
                      child: Text(
                        userdt,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), // สีเงา
                      spreadRadius: 1, // รัศมีการกระจาย
                      blurRadius: 9, // ความเบลอ
                      offset: Offset(0, 3), // การเยื้อง
                    ),
                  ],
                ),
                child: TextField(
                  controller: search,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: 'Search....',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<Detail>>(
                future: detailTodoController.getdataTodo(),
                builder: (context, snapshot) {
                  if (snapshot.data == null) {
                    return Center();
                  } else if (snapshot.data!.length == 0) {
                    return Center();
                  } else {
                    return Padding(
                      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          Detail detaillist = snapshot.data![index];
                          if (!detaillist.userTodoListTitle
                                  .toLowerCase()
                                  .contains(search.text.toLowerCase()) ||
                              !detaillist.userTodoListTitle
                                  .toUpperCase()
                                  .contains(search.text.toUpperCase())) {
                            return Container();
                          }
                          return Card(
                              color: Colors.white,
                              shadowColor: Colors.black,
                              child: Container(
                                height: MediaQuery.of(context).size.height *
                                    0.20, // ให้ความสูงของ Container เป็น 20% ของความสูงของหน้าจอ
                                // height: 170,
                                child: Stack(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 30, 87, 287),
                                            child: Checkbox(
                                              activeColor: Color(0xFF3CB189),
                                              value: detaillist
                                                          .userTodoListCompleted ==
                                                      '1' ||
                                                  detaillist
                                                          .userTodoListCompleted ==
                                                      true,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  detaillist
                                                          .userTodoListCompleted =
                                                      value! ? '0' : '1';
                                                });
                                              },
                                              shape:
                                                  CircleBorder(), // กำหนดให้เป็นวงกลม
                                            )),
                                      ],
                                    ),
                                    Positioned(
                                      right: 11,
                                      top: 3,
                                      child: GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet<void>(
                                            backgroundColor: Color(0xFFFFFFFF),
                                            context: context,
                                            builder: (BuildContext context) {
                                              return SizedBox(
                                                height:
                                                    251, //ความสูงของ Bottomsheet ที่ popup ขึ้นมา
                                                child: Center(
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                      left: 25,
                                                      right: 25,
                                                    ), //ปรับให้ Border ห่างจาก Bottomsheet
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        SizedBox(
                                                          height:
                                                              50, // ปรับความสูงให้ห่างจาก Bottomsheet
                                                        ),
                                                        StyleMyBottomSheet(
                                                          "Edit",
                                                          Icons.edit,
                                                          220,
                                                          onTap: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        Addyourtodo(
                                                                  UserID:
                                                                      detaillist
                                                                          .userId,
                                                                  Titeldata:
                                                                      "${detaillist.userTodoListTitle} ",
                                                                  Decdata:
                                                                      "${detaillist.userTodoListDesc}",
                                                                  isActive:
                                                                      detaillist.userTodoListCompleted ==
                                                                              '1'
                                                                          ? true
                                                                          : false,
                                                                  UserTodoID:
                                                                      detaillist
                                                                          .userTodoListId,
                                                                  appbar:
                                                                      'Your Todo',
                                                                ),
                                                              ),
                                                            ).then((value) {
                                                              setState(() {});
                                                            });
                                                          },
                                                        ),
                                                        SizedBox(
                                                          width: 80,
                                                        ),
                                                        Divider(
                                                          color: const Color
                                                              .fromARGB(
                                                              255, 56, 55, 55),
                                                          thickness:
                                                              0.5, //ปรับความหนาของเส้น
                                                        ),
                                                        StyleMyBottomSheet(
                                                          "Delete",
                                                          Icons
                                                              .delete_forever_outlined,
                                                          200,
                                                          onTap: () {
                                                            addEditDeleteDetailController
                                                                .deleteYourTodo(
                                                              detaillist
                                                                  .userTodoListId,
                                                              context,
                                                            );
                                                            setState(() {});
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Container(
                                          child:
                                              Icon(Icons.more_horiz_outlined),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          40, 15, 45, 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Column(
                                              children: [
                                                Text(
                                                  '${detaillist.userTodoListTitle}',
                                                  style: TextStyle(
                                                    fontSize:
                                                        20, // ปรับขนาดตัวอักษร
                                                    fontWeight: FontWeight
                                                        .bold, // ใส่ตัวหนา
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    color: const Color.fromARGB(
                                                        255,
                                                        4,
                                                        80,
                                                        7), // สีของตัวอักษร
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            40, 22, 45, 10),
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    '${DateFormat('h:mm a - MM/dd/yy').format(detaillist.userTodoListLastUpdate)}',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          80,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            40, 60, 15, 0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${detaillist.userTodoListDesc}',
                                              style: const TextStyle(
                                                fontSize: 15,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              maxLines:
                                                  5, // กำหนด maxLines ได้ที่นี่
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                        },
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Addyourtodo(
                          UserID: widget.useid,
                          UserTodoID: 1,
                          Decdata: '',
                          Titeldata: '',
                          isActive: false,
                          appbar: 'Add Your Todo',
                        ))).then((value) => setState(() {}));
          },
          backgroundColor: Color(0xFF0D7A5C),
          child: Icon(
            Icons.calendar_month,
            size: 35,
            color: Colors.white,
          ),
          shape: CircleBorder(),
        ),
      ),
    );
  }
}
