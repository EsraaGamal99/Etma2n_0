
import 'package:etma2n/Settings/main_settingDocpage%20.dart';
import 'package:etma2n/Settings/main_setting_page.dart';
import 'package:etma2n/articles_page_doctor.dart';
import 'package:etma2n/doctor_schedule/DaysOfSCh.dart';
import 'package:etma2n/doctor_schedule/doctor.dart';
import 'package:etma2n/layout/consultation/Doctor_Questions_View.dart';
import 'package:flutter/material.dart';

import 'shared/component/components.dart';

class DocHomeScreen extends StatelessWidget {
  const DocHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // double height = MediaQuery.of(context).size.height;
   // double width = MediaQuery.of(context).size.width;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          actions: [

            IconButton(
                onPressed: () {
                  navigateTo(context, const SettingDocScreen());
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
                  Description: "",
                  onClick: () {
                    navigateTo(context,  Days());
                  },
                  image1: const NetworkImage(
                      'https://png.pngtree.com/png-clipart/20220605/original/pngtree-calendar-agenda-app-appointment-binder-png-image_7956977.png'
                  ),
                  FunctionName: 'جدول المواعيد',
                  //Height: height*0.5,
                ),

                const SizedBox(
                  height: 15.0,
                ),

                homeCard(
                  Description: "",
                  onClick: () {
                    navigateTo(context, const ArticlesDoctor());
                  },
                  image1: const NetworkImage(
                      'https://www.nicepng.com/png/full/18-188614_place-for-you-to-create-unique-articles-and.png'
                  ),
                  FunctionName: 'اضافة مقالات',
                  //Height: height*0.5,
                ),

                const SizedBox(
                  height: 15.0,
                ),

                homeCard(
                  Description: "",
                  onClick: () {
                    navigateTo(context, const ConsQuestionHome());
                  },
                  image1: const NetworkImage(
                      'https://png.pngtree.com/png-vector/20220127/ourmid/pngtree-cartoon-style-i-have-no-idea-i-have-questions-i-can-png-image_4370314.png'
                  ),
                  FunctionName: 'الرد علي الاستشارة',
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
