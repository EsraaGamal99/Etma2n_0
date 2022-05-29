
import 'package:etma2n/shared/component/components.dart';
import 'package:flutter/material.dart';
import '../models/doctors_model.dart';
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
          backgroundColor: const Color(0xFF5271ff),
          title: const Center(
            child: Text(
              'اختر طبيبك',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.menu,
              ),
              onPressed: () {
                //onPrint();
              },
              color: Colors.white,
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
                  GestureDetector(
                    onTap: () {
                      print('search now');
                      },
                    child: Container(
                      decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.white, Colors.grey],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                    ),
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                  ),
                      padding: const EdgeInsets.all(8.0,),
                      child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Icon(
                        Icons.search,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        '  بحث  ',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
                  const SizedBox(height: 15.0,),
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
                      onClick: () async {
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
