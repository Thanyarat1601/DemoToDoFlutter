import 'package:flutter/material.dart';
import 'package:buttons_flutter/buttons_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:control_style/control_style.dart';

class Stylreogin extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final _formKey = GlobalKey<FormState>();
  bool Texthint;

  Stylreogin(
    this.label,
    this.Texthint,
    {
    required this.controller,

  
  });
  late String labelText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: Texthint,
          controller: controller,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFF3F3F3)),
              borderRadius: BorderRadius.circular(15),
            ),
            hintText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            filled: true, // กำหนดให้มีการเติมสีพื้นหลัง
            fillColor: Color(0xFFF3F3F3), // กำหนดสีพื้นหลัง
          ),
          validator: label == 'Email'
              ? MultiValidator([
                  RequiredValidator(errorText: "Email is required"),
                  EmailValidator(errorText: "Enter a valid email address")
                ])
              : RequiredValidator(errorText: "Please Enter $label"),
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class button extends StatelessWidget {
  final String buttonstyle;
  final VoidCallback
      onPressed; //VoidCallback ใช้เพื่อระบุว่าฟังก์ชันที่รับเป็นพารามิเตอร์นั้นไม่มีการส่งค่ากลับ

  button(this.buttonstyle, {required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ElevatedButton(
        onPressed: onPressed, // ตัวแปร
        style: ElevatedButton.styleFrom(
          fixedSize: Size(339, 70),
          // padding: const EdgeInsets.zero,
          textStyle: TextStyle(
            fontSize: 20,
          ),
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(15), // ปรับขนาดเป็นขอบโค้งตามต้องการ
          ),
          padding: EdgeInsets.zero, // เพื่อให้ Container มีขนาดเท่ากับปุ่ม
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF53CD9F), // เปลี่ยนสีตามที่ต้องการ
                Color(0xFF0D7A5C),
              ],
            ),
            borderRadius:
                BorderRadius.circular(15), // ปรับขนาดเป็นขอบโค้งตามต้องการ
          ),
          child: Container(
            alignment: Alignment.center, // จัดให้ข้อความอยู่ตรงกลาง
            child: Text(
              buttonstyle, // ตัวแปร
              style: TextStyle(
                color: Colors.white, // เปลี่ยนสีข้อความตามต้องการ
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class StyleMyBottomSheet extends StatelessWidget {
  final String text;
  final IconData iconData;
  // final double sizeBox;
  final VoidCallback? onTap;

  const StyleMyBottomSheet(this.text, this.iconData,
  //  this.sizeBox,
      {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  iconData,
                  color: Color(0xFF0D7A5C),
                  size: 20,
                ),
                SizedBox(width: 5,),
                 Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF0D7A5C),
              ),
            ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFF0D7A5C),
              size: 25,
            ),
          ],
        ),
      ),
    );
  }
}

class TitleTextwidget extends StatelessWidget {
  final TextEditingController Controller;
  TitleTextwidget({super.key, required this.Controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: Controller,
        decoration: InputDecoration(
          border: DecoratedInputBorder(
            child: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
            ),
           
          shadow:  [
          BoxShadow(
           color: Colors.grey.withOpacity(0.5), // สีเงา
             spreadRadius: 0, // รัศมีการกระจาย
             blurRadius: 8, // ความเบลอ
             offset: Offset(0, 2), // การเยื้อง
           ),
       ],
          ),
          hintText: ('Title'),
          filled: true,
          fillColor: Colors.white,
        ),
        validator: RequiredValidator(errorText: 'Please enter Title'),
        style: TextStyle(
          fontSize: 16,
          color: Color.fromARGB(255, 140, 139, 138),
        ),
      ),
    );
  }
}

class DescriptionTextwidget extends StatelessWidget {
  final TextEditingController Controller;
  const DescriptionTextwidget({super.key, required this.Controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: Controller,
        maxLines: 5,
              decoration: InputDecoration(
          border: DecoratedInputBorder(
            child: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
            ),
          shadow:  [
          BoxShadow(
           color: Colors.grey.withOpacity(0.5), // สีเงา
             spreadRadius: 0, // รัศมีการกระจาย
             blurRadius: 8, // ความเบลอ
             offset: Offset(0, 2), // การเยื้อง
           ),
       ],
          ),
          hintText: ('Description'),
          filled: true,
          fillColor: Colors.white,
        ),
        validator: MultiValidator([
          MaxLengthValidator(250, 
          errorText: 'Message must not exceed 250 characters.'),
          RequiredValidator(errorText: 'Please enter Description '),
        ]),
        style: TextStyle(
          fontSize: 16,
          color: Color.fromARGB(255, 140, 139, 138),
        ),
      ),
    );
  }
}
