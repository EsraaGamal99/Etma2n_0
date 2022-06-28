import 'package:etma2n/MOVE_ON/move_on_home.dart';
import 'package:etma2n/Settings/main_setting_page.dart';
import 'package:etma2n/appointment/menu_doctors.dart';
import 'package:etma2n/doctor_calender.dart';
import 'package:etma2n/doctor_schedule/doctor.dart';
import 'package:etma2n/layout/consultation/DoctorAnswerCon.dart';
import 'package:etma2n/layout/consultation/Doctor_Questions_View.dart';
import 'package:etma2n/layout/consultation/cons_home.dart';
import 'package:etma2n/layout/test/test_home.dart';
import 'package:etma2n/shared/AppCubit/cubit.dart';

import 'package:etma2n/todo_list/toDoHome.dart';
import 'package:flutter/material.dart';

import 'shared/component/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          actions: [
          /*  IconButton(
                onPressed: () {
                  navigateTo(context, Doctor());
                },
                icon: const Icon(
                  Icons.calendar_today_outlined,
                )),
            IconButton(
                onPressed: () {
                  navigateTo(context, ConsQuestionHome());
                },
                icon: const Icon(
                  Icons.help,
                )),*/
            IconButton(
                onPressed: () {
                  navigateTo(context, SettingScreen());
                },
                icon: const Icon(
                  Icons.settings,
                )),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                homeCard(
                  onClick: () {
                    navigateTo(context, const MenuDoctors());
                  },
                  image1: NetworkImage(
                      'https://icons-for-free.com/download-icon-alert+notification+date+appointment-1320567851973095506_512.png'
                  ),
                  FunctionName: 'حجز معاد',
                  Description: "احجز جلستك بسولة وامان",
                  //Height: height*0.5,
                ),
                const SizedBox(
                  height: 15.0,
                ),

                homeCard(
                  onClick: () {
                    navigateTo(context, const MoveonHomePage());
                  },
                  image1: NetworkImage(
                      'https://cdn-icons-png.flaticon.com/512/1189/1189156.png'
                  ),
                  FunctionName: 'الدعم النفسى',
                 Description: "ابدأ رحلتك فى الدعم النفسي",
                  //Height: height*0.5,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                homeCard(
                  onClick: () {
                    navigateTo(context, const TestHome());
                  },
                  image1: NetworkImage(
                      'https://cdn.iconscout.com/icon/premium/png-256-thumb/test-3467516-2901488.png'
                  ),
                  FunctionName: 'الإختبار النفسي',
                  Description: "اختبر صحتك النفسية بسهولة",
                  //Height: height*0.5,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                homeCard(
                  onClick: () {
                    navigateTo(context, const ConsHome());
                  },
                  image1: NetworkImage(
                      'https://www.nicepng.com/png/full/334-3345245_icon-consultant.png'
                  ),
                  FunctionName: 'استشارة نفسية',
                  Description: "اسئل طبيبك بكل سهولة",
                  //Height: height*0.5,
                ),


                const SizedBox(
                  height: 15,
                ),
                homeCard(
                  onClick: () {
                    navigateTo(context, TodoHomeScreen());
                  },
                  image1: NetworkImage(
                     'https://cdn-icons-png.flaticon.com/512/762/762677.png',
                  ),
                  FunctionName: 'قائمة المهام',
                  Description: "نظم يومك وضع مهامك بكل سهولة",
                  //Height: height*0.5,
                ),

                const SizedBox(
                  height: 15.0,
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
