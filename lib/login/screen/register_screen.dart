import 'package:date_field/date_field.dart';
import 'package:etma2n/home.dart';
import 'package:etma2n/login/constant/constant.dart';
import 'package:etma2n/login/widget/imagefield.dart';
import 'package:etma2n/login/widget/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final doctorPassword = 'DOCTOR#P@SSWORD';
  DateTime? selectedData;
  bool isDoctor = false;
  late String email, password;
  DateTime selectedDate = DateTime.now();
  Color secondColor = const Color(0xff576dca);
  String selectedGender = 'انثي';
  List<String> gender = [
    'انثي',
    'ذكر',
  ];
  final format = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
        backgroundColor: KTherdycolor,
        body: Center(
          child: ListView(
            children: <Widget>[
              CustomImageField(
                image: AssetImage('assets/images/etmaan.png'),
              ),
              Center(
                  child: Column(
                children: [
                  Text(
                    'اهلا بيك',
                    style: TextStyle(
                        fontSize: 22,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    'جملة ترحيبيه ^_^',
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 17,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              )),

              SizedBox(height: height * .044),

              CustomTextField(icon: Icons.perm_identity, hint: 'اسم المستخدم'),
              SizedBox(height: height * .022),

              CustomTextField(
                  onClick: (value) {
                    email = value!;
                  },
                  icon: Icons.email,
                  hint: 'البريد'),
              SizedBox(height: height * .022),

              CustomTextField(icon: Icons.phone, hint: 'رقم الهاتف'),
              SizedBox(height: height * .022),

              //تاريخ الميلاد
              Padding(
                padding: const EdgeInsets.only(right: 25, left: 25),
                child: Material(
                  shadowColor: KSeconedarycolor,
                  elevation: 8.0,
                  borderRadius: BorderRadius.circular(30),
                  child: DateTimeField(
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2052),
                    onDateSelected: (DateTime value) {
                      setState(() {
                        selectedData = value;
                      });
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.calendar_today,
                        color: KSeconedarycolor,
                      ),
                      filled: true,
                      fillColor: KTherdycolor,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: KSeconedarycolor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: KSeconedarycolor),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: KSeconedarycolor),
                      ),
                    ),
                    //label: 'تاريخ ميلادك',
                    dateFormat: DateFormat.yMd(),
                    selectedDate: selectedData,
                  ),
                ),
              ),

              SizedBox(height: height * .022),
              // النوع
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 1,
                ),
                child: Material(
                  shadowColor: KSeconedarycolor,
                  elevation: 8.0,
                  borderRadius: BorderRadius.circular(30),
                  child: DecoratedBox(
                    decoration: ShapeDecoration(
                      color: KTherdycolor,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 1.0,
                            style: BorderStyle.solid,
                            color: KSeconedarycolor),
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 7.0),
                      child: DropdownButton<String>(
                        //iconEnabledColor: KSeconedarycolor,
                        value: selectedGender,
                        elevation: 10,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: KSeconedarycolor,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedGender = newValue!;
                          });
                        },
                        underline: SizedBox(),
                        items: gender
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * .022),

              CustomTextField(
                  onClick: (value) {
                    password = value!;
                  },
                  icon: Icons.lock,
                  icon1: Icons.remove_red_eye,
                  onPressed: () {},
                  hint: 'كلمة السر'),
              SizedBox(height: height * .022),

              CustomTextField(
                  onClick: (value) {
                    password = value!;
                  },
                  icon: Icons.lock,
                  icon1: Icons.remove_red_eye,
                  onPressed: () {},
                  hint: 'تأكيد كلمة السر'),
              SizedBox(height: height * .035),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 111),
                child: Builder(
                  builder: (context) => FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17),
                      side: BorderSide(color: KTherdycolor),
                    ),
                    onPressed: () async {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    color: KSeconedarycolor,
                    child: Text(
                      'تسجيل',
                      style: TextStyle(color: KTherdycolor),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * .025),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'بالفعل لديك حساب؟  ',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      'تسجيل دخول ',
                      style: TextStyle(
                        color: KButtomcolor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * .030),
            ],
          ),
        ),
      ),
    );
  }
}
