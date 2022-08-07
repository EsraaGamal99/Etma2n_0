import 'package:etma2n/doc.dart';
import 'package:etma2n/doctor_schedule/cubit/cubit.dart';
import 'package:etma2n/doctor_schedule/cubit/states.dart';
import 'package:etma2n/doctor_schedule/doctor.dart';
import 'package:etma2n/login/constant/constant.dart';
import 'package:etma2n/shared/component/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Days extends StatelessWidget {
  const Days({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorScheduleCubit, DoctorScheduleStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = DoctorScheduleCubit.get(context);
          //var dates = cubit.Dates;
          Color secondColor = const Color(0xff576dca);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                title: Text(
                  'مواعيدك المتاحة',
                ),
                actions: [
                  IconButton(
                      onPressed: () {
                        navigateTo(context, Doctor());
                      },
                      icon: const Icon(
                        Icons.add,
                      )),
                ],
              ),
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 15.0),
                          child: MaterialButton(
                            shape: const StadiumBorder(),
                            color: secondColor,
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            onPressed: () {
                              navigateTo(context, doc(cubit.SelectedDatessat));
                            },
                            child: Text(
                              "السبت",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 15.0),
                          child: MaterialButton(
                            shape: const StadiumBorder(),
                            color: secondColor,
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            onPressed: () {
                              navigateTo(context, doc(cubit.SelectedDatessun));
                            },
                            child: Text(
                              "الأحد",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 15.0),
                          child: MaterialButton(
                            shape: const StadiumBorder(),
                            color: secondColor,
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            onPressed: () {
                              navigateTo(context, doc(cubit.SelectedDatesmon));
                            },
                            child: Text(
                              "الأثنين",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 15.0),
                          child: MaterialButton(
                            shape: const StadiumBorder(),
                            color: secondColor,
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            onPressed: () {
                              navigateTo(context, doc(cubit.SelectedDatestue));
                            },
                            child: Text(
                              "الثلاثاء",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 15.0),
                          child: MaterialButton(
                            shape: const StadiumBorder(),
                            color: secondColor,
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            onPressed: () {
                              navigateTo(context, doc(cubit.SelectedDateswed));
                            },
                            child: Text(
                              "الأربعاء",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 15.0),
                          child: MaterialButton(
                            shape: const StadiumBorder(),
                            color: secondColor,
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            onPressed: () {
                              navigateTo(context, doc(cubit.SelectedDatesthu));
                            },
                            child: Text(
                              "الخميس",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          margin: const EdgeInsets.only(bottom: 15.0),
                          child: MaterialButton(
                            shape: const StadiumBorder(),
                            color: secondColor,
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                            onPressed: () {
                              navigateTo(context, doc(cubit.SelectedDatesfri));
                            },
                            child: Text(
                              "الجمعة",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
