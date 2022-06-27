import 'package:date_field/date_field.dart';
import 'package:etma2n/home.dart';
import 'package:etma2n/login/reg_cubit/cubit.dart';
import 'package:etma2n/shared/component/components.dart';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../widgets/components.dart';
import '../constant/constant.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {


  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final doctorPassword = 'DOCTOR#P@SSWORD';
  late DateTime selectedData;
  bool isDoctor = false;
  late var emcontroller   =TextEditingController();
  late var conpasscontroller   =TextEditingController();
  late var passcontroller =TextEditingController();
  late var phoncontroller =TextEditingController();
  late var namecontroller =TextEditingController();
  late var username =TextEditingController();
  late String email, password,phone,confirm_password;
  DateTime selectedDate = DateTime.now();
  Color secondColor = const Color(0xff576dca);
  String selectedGender = 'انثي';
  List<String> gender = ['انثي','ذكر',];
  final format = DateFormat('yyyy-MM-dd');
  bool isPassword=true;
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

                    customImageField(
                      height: MediaQuery.of(context).size.height * .25,
                      image: const AssetImage('assets/images/etmaan.png'),
                    ),

                    //welcome
                    Center(child: Column(
                      children: [
                        const Text(
                          'اهلا بيك',
                          style: TextStyle(
                              fontSize: 22,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'أطمئن ,طريقك للاستقرار النفسي',
                          style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 17,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    )),

                    SizedBox(height: height * .044),

                    //name
                    defaultFormField1(
                        controller: namecontroller,
                        type: TextInputType.name,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'الاسم فارغ';
                          }
                          return null;
                        },
                        label: 'الاسم',
                        prefix: Icons.person_outline_outlined
                    ),
                    SizedBox(height: height * .022),

                    //email
                    defaultFormField1(
                      controller: emcontroller,
                      type: TextInputType.emailAddress,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'البريد فارغ';
                        }
                        return null;
                      },
                      label: 'البريد',
                      prefix: Icons.email_outlined,
                    ),

                    SizedBox(height: height * .022),

                    //phone number
                    defaultFormField1(
                      controller: phoncontroller,
                      type: TextInputType.phone,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'رقم الهاتف فارغ';
                        }
                        return null;
                      },
                      label: 'رقم الهاتف',
                      prefix: Icons.phone_outlined,
                    ),

                    SizedBox(height: height * .022),

                    //تاريخ الميلاد
                    Padding(
                      padding: const EdgeInsets.all(1),
                      child: Material(
                        shadowColor: KSeconedarycolor,
                        elevation: 8.0,
                        //borderRadius: BorderRadius.circular(30),
                        child: dateForm(),

                      ),
                    ),

                    SizedBox(height: height * .022),
                    // النوع
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1,),
                      child: Material(
                        shadowColor: KSeconedarycolor,
                        elevation: 8.0,
                        borderRadius: BorderRadius.circular(30),
                        child: DecoratedBox(
                          decoration: const ShapeDecoration(
                            color:  Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1.0, style: BorderStyle.solid,
                                  color: KSeconedarycolor),
                              borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 7.0),
                            child: DropdownButton<String>(
                              value: selectedGender,
                              elevation: 8,
                              icon: const Icon(Icons.arrow_drop_down,color: Colors.white,),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedGender = newValue!;
                                });
                              },
                              underline: const SizedBox(height: 2,),
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

                    //password
                    defaultFormField1(
                      controller: passcontroller,
                      label: 'كلمة السر',
                      prefix: Icons.lock,
                      suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                      isPassword: isPassword,
                      suffixPressed: ()
                      {
                        setState(()
                        {
                          isPassword = !isPassword;
                        });
                      },
                      type: TextInputType.visiblePassword,
                      validate: (String value)
                      {
                        if(value.isEmpty)
                        {
                          return 'كلمة السر قصيرة';
                        }

                        return null;
                      },
                    ),

                    SizedBox(height: height * .022),

                    defaultFormField1(
                      controller: conpasscontroller,
                      label: 'تاكيد كلمة السر',
                      prefix: Icons.lock,
                      suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                      isPassword: isPassword,
                      suffixPressed: ()
                      {
                        setState(()
                        {
                          isPassword = !isPassword;
                        });
                      },
                      type: TextInputType.visiblePassword,
                      validate: (String value)
                      {
                        if(value.isEmpty)
                        {
                          return 'كلمة السر غير متطابقة';
                        }

                        return null;
                      },
                    ),

                    SizedBox(height: height * .035),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 111),
                      child: Builder(
                        builder: (context) => MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                            side: const BorderSide(color: KTherdycolor),
                          ),
                          onPressed: () async {

                            RegisterCubit.get(context).userRegister(
                              name: namecontroller.text,
                              email: emcontroller.text,
                              phone: phoncontroller.text,
                              gender: selectedGender,
                              password: passcontroller.text,
                            );
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
                          onTap: () { navigateTo ( context,const LoginScreen());},

                          child: const Text(
                            'تسجيل دخول ',
                            style: TextStyle(
                              color: KSeconedarycolor,
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
