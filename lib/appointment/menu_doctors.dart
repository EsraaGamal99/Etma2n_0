import 'package:etma2n/Settings/main_setting_page.dart';
import 'package:etma2n/shared/component/components.dart';

import 'package:flutter/material.dart';
import '../models/doctors_model.dart';
import '../shared/styles/colors.dart';
import '../widgets/components.dart';
import 'doctor_profile.dart';

class MenuDoctors extends StatelessWidget {
  const MenuDoctors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'اختر طبيبك',
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.settings,
              ),
              onPressed: () {
                navigateTo(context, const SettingScreen());
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //البحث
                  Container(
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: const EdgeInsets.only(right: 11, left: 11, top: 13,bottom: 10),
                //height: 70,
                child: Expanded(
                  child: Text(
                    'يستطيع صرف أدوية علاجية لك, يعمل الطبيب علي فهم وضعك ويقوم بتشخيص حالتك ويقترح عليك الحلول المناسبة لحالتك',
                    style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
                  const SizedBox(height: 10.0,),

                  ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => doctorList(
                      ratcolor: doctor[index].ratecolor,
                      rateicons: doctor[index].rateicon,
                      docname: doctor[index].docname,
                      docabout: doctor[index].docabout,
                      image1: NetworkImage(doctor[index].docpic),
                      onClick: () {
                        navigateTo ( context, DoctorProfile(docindex: index));
                  },
                ),
                    separatorBuilder: (context, index) => myLine(Colors.grey[400]!),
                    itemCount: doctor.length,
              ),
            ]
            ),
          ),
        ),
      ),
    );
  }
}
