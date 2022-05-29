import 'package:date_field/date_field.dart';
import 'package:etma2n/home.dart';
import 'package:etma2n/login/reg_cubit/cubit.dart';
import 'package:etma2n/login/reg_cubit/states.dart';
import 'package:etma2n/shared/component/components.dart';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../widgets/components.dart';
import '../constant/constant.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final doctorPassword = 'DOCTOR#P@SSWORD';
  var formKey = GlobalKey<FormState>();
  //late DateTime selectedData;
  bool isDoctor = false;
  var email = TextEditingController(),
      password = TextEditingController(),
      phone = TextEditingController(),
      confirm_password = TextEditingController(),
      username = TextEditingController();
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
    return BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Directionality(
            textDirection: ui.TextDirection.rtl,
            child: Scaffold(
              backgroundColor: KTherdycolor,
              body: Center(
                child: ListView(
                  children: <Widget>[
                    customImageField(
                      height: MediaQuery.of(context).size.height * .3,
                      image: const AssetImage('assets/images/etmaan.png'),
                    ),

                    //welcome
                    Center(
                        child: Column(
                      children: [
                        const Text(
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

                    customTextField(
                      controller: username,
                      type: TextInputType.text,
                      /* onClick: (value) {
                  username = value;
                },*/
                      onPressed: (){
                        print('nada');
                      },
                      icon: Icons.perm_identity,
                      hint: 'اسم المستخدم',
                    ),
                    SizedBox(height: height * .022),

                    customTextField(
                        controller: email,
                        type: TextInputType.emailAddress,
                        /*  onClick: (value) {
                    email = value;
                  },*/
                        onPressed: (){
                          print('nada');
                        },
                        icon: Icons.email,
                        hint: 'البريد'),
                    SizedBox(height: height * .022),

                    customTextField(
                      controller: phone,
                      type: TextInputType.phone,
                      icon: Icons.phone,
                      hint: 'رقم الهاتف',
                      onPressed: (){
                        print('nada');
                      },
                    ),
                    SizedBox(height: height * .022),

                    //تاريخ الميلاد
                    Padding(
                      padding: const EdgeInsets.only(right: 25, left: 25),
                      child: Material(
                        shadowColor: KSeconedarycolor,
                        elevation: 8.0,
                        borderRadius: BorderRadius.circular(30),
                        child: dateForm(),
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
                          decoration: const ShapeDecoration(
                            color: KTherdycolor,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1.0,
                                  style: BorderStyle.solid,
                                  color: KSeconedarycolor),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 7.0),
                            child: DropdownButton<String>(
                              value: selectedGender,
                              elevation: 10,
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: KTherdycolor,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedGender = newValue!;
                                });
                              },
                              underline: const SizedBox(),
                              items: gender.map<DropdownMenuItem<String>>(
                                  (String value) {
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

                    customTextField(
                        controller: password,
                        type: TextInputType.visiblePassword,
                        /*onClick: (value) {
                    password = value;
                  },*/
                        icon: Icons.lock,
                        icon1: Icons.remove_red_eye,
                        onPressed: () {},
                        hint: 'كلمة السر'),
                    SizedBox(height: height * .022),

                    customTextField(
                        controller: confirm_password,
                        type: TextInputType.visiblePassword,
                        /* onClick: (value) {
                    confirm_password = value;
                  },*/
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
                            side: const BorderSide(color: KTherdycolor),
                          ),
                          onPressed: () async {
///////////////////////
                           /*cubit.userRegister(
                              name: username.text,
                              email: email.text,
                              phone: phone.text,
                              gender: selectedGender,
                              password: password.text,
                            );*/
                            navigateTo(context, const HomeScreen());
                          },
                          color: KSeconedarycolor,
                          child: const Text(
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
                        const Text(
                          'بالفعل لديك حساب؟  ',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            navigateTo(context, LoginScreen());
                          },
                          child: const Text(
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
        });
  }

  Widget dateForm() => DateTimeFormField(
        decoration: const InputDecoration(
          hintStyle: TextStyle(color: Colors.black45),
          errorStyle: TextStyle(color: Colors.redAccent),
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.event_note),
          labelText: 'Only time',
        ),
        mode: DateTimeFieldPickerMode.date,
        autovalidateMode: AutovalidateMode.always,
        validator: (e) =>
            (e?.day ?? 0) == 1 ? 'Please not the first day' : null,
        onDateSelected: (DateTime value) {
          print(value);
        },
      );
}
