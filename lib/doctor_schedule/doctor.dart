import 'package:etma2n/doc.dart';
import 'package:etma2n/login/constant/constant.dart';
import 'package:etma2n/shared/component/components.dart';
import 'package:etma2n/shared/component/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'dart:ui' as ui;

class Doctor extends StatefulWidget {
  @override
  State<Doctor> createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();
  bool isBottomSheetShow = false;

  late String StartDate;
  late int start;

  late int end;
  late String EndDate;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorScheduleCubit, DoctorScheduleStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DoctorScheduleCubit.get(context);
        var dates = cubit.Dates;
        bool isPress = cubit.isPress;
        Color secondColor = const Color(0xff576dca);
        return Directionality(
          textDirection: ui.TextDirection.rtl,
          child: Scaffold(
            key: scaffoldkey,
            appBar: AppBar(
              title: const Text(
                'مواعيد الدكتور',
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      navigateTo(context, doc());
                    },
                    icon: const Icon(
                      Icons.add,
                    )),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Buidsch(
                      day: '  السبت',
                      icon: cubit.fab,
                      OnPress: () {
                        {
                          isPress=false;
                          cubit.ResetData();
                          scaffoldkey.currentState
                              ?.showBottomSheet(
                                (context) => Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      topRight: Radius.circular(50),
                                    ),
                                    color: KTherdycolor,
                                  ),
                                  padding: const EdgeInsets.all(20.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            MaterialButton(
                                              child: const Text(
                                                "من",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              shape: const StadiumBorder(),
                                              color: secondColor,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15.0),
                                              onPressed: () => showDialog(
                                                context: context,
                                                builder: (_) =>
                                                    cubit.defultAlertDialog(
                                                  dates: dates,
                                                  context: context,
                                                  date: 's1',
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 15.0,
                                            ),
                                            MaterialButton(
                                              child: const Text(
                                                "الى",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              shape: const StadiumBorder(),
                                              color: secondColor,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15.0),
                                              onPressed: () => showDialog(
                                                context: context,
                                                builder: (_) =>
                                                    cubit.defultAlertDialog(
                                                  dates: cubit.Dates,
                                                  context: context,
                                                  date: 'e1',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 30.0,
                                        ),
                                        if (isPress)
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              MaterialButton(
                                                child: const Text(
                                                  "من",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                shape: const StadiumBorder(),
                                                color: secondColor,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15.0),
                                                onPressed: () => showDialog(
                                                  context: context,
                                                  builder: (_) =>
                                                      cubit.defultAlertDialog(
                                                    dates: cubit.Dates2,
                                                    context: context,
                                                    date: 's2',
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 15.0,
                                              ),
                                              MaterialButton(
                                                child: const Text(
                                                  "الى",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                shape: const StadiumBorder(),
                                                color: secondColor,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15.0),
                                                onPressed: () => showDialog(
                                                  context: context,
                                                  builder: (_) =>
                                                      cubit.defultAlertDialog(
                                                    dates: cubit.Dates2,
                                                    context: context,
                                                    date: 'e2',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        const SizedBox(
                                          height: 50.0,
                                        ),
                                        Row(
                                          children: [
                                            MaterialButton(
                                              child: const Text(
                                                "حفظ",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              shape: const StadiumBorder(),
                                              color: secondColor,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15.0),
                                              onPressed: () {
                                                cubit.checkDoctor('sat');

                                                isPress = true;

                                                Navigator.pop(context);
                                                // dates = DatesConstant.removeRange(cubit.start1, cubit.end1) ;
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                elevation: 20.0,
                              )
                              .closed
                              .then((value) {
                            cubit.changeBottomSheet(
                                isShow: false, icon: Icons.add);
                          });

                          cubit.changeBottomSheet(
                              isShow: true, icon: Icons.edit);
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Buidsch(
                      day: '  الأحد',
                      icon: cubit.fab,
                      OnPress: () {
                        {
                          isPress=false;
                          cubit.ResetData();
                          scaffoldkey.currentState
                              ?.showBottomSheet(
                                (context) => Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      topRight: Radius.circular(50),
                                    ),
                                    color: KTherdycolor,
                                  ),
                                  padding: const EdgeInsets.all(20.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            MaterialButton(
                                              child: const Text(
                                                "من",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              shape: const StadiumBorder(),
                                              color: secondColor,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15.0),
                                              onPressed: () => showDialog(
                                                context: context,
                                                builder: (_) =>
                                                    cubit.defultAlertDialog(
                                                  dates: dates,
                                                  context: context,
                                                  date: 's1',
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 15.0,
                                            ),
                                            MaterialButton(
                                              child: const Text(
                                                "الى",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              shape: const StadiumBorder(),
                                              color: secondColor,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15.0),
                                              onPressed: () => showDialog(
                                                context: context,
                                                builder: (_) =>
                                                    cubit.defultAlertDialog(
                                                  dates: cubit.Dates,
                                                  context: context,
                                                  date: 'e1',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 30.0,
                                        ),
                                        if (isPress)
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              MaterialButton(
                                                child: const Text(
                                                  "من",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                shape: const StadiumBorder(),
                                                color: secondColor,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15.0),
                                                onPressed: () => showDialog(
                                                  context: context,
                                                  builder: (_) =>
                                                      cubit.defultAlertDialog(
                                                    dates: cubit.Dates2,
                                                    context: context,
                                                    date: 's2',
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 15.0,
                                              ),
                                              MaterialButton(
                                                child: const Text(
                                                  "الى",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                shape: const StadiumBorder(),
                                                color: secondColor,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15.0),
                                                onPressed: () => showDialog(
                                                  context: context,
                                                  builder: (_) =>
                                                      cubit.defultAlertDialog(
                                                    dates: cubit.Dates2,
                                                    context: context,
                                                    date: 'e2',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        const SizedBox(
                                          height: 50.0,
                                        ),
                                        Row(
                                          children: [
                                            MaterialButton(
                                              child: const Text(
                                                "حفظ",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              shape: const StadiumBorder(),
                                              color: secondColor,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15.0),
                                              onPressed: () {
                                                cubit.checkDoctor('sun');

                                                isPress = true;

                                                Navigator.pop(context);
                                                // dates = DatesConstant.removeRange(cubit.start1, cubit.end1) ;
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                elevation: 20.0,
                              )
                              .closed
                              .then((value) {
                            cubit.changeBottomSheet(
                                isShow: false, icon: Icons.add);
                          });

                          cubit.changeBottomSheet(
                              isShow: true, icon: Icons.edit);
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Buidsch(
                      day: 'الاثنين',
                      icon: cubit.fab,
                      OnPress: () {
                        {
                          isPress=false;
                          cubit.ResetData();
                          scaffoldkey.currentState
                              ?.showBottomSheet(
                                (context) => Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      topRight: Radius.circular(50),
                                    ),
                                    color: KTherdycolor,
                                  ),
                                  padding: const EdgeInsets.all(20.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            MaterialButton(
                                              child: const Text(
                                                "من",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              shape: const StadiumBorder(),
                                              color: secondColor,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15.0),
                                              onPressed: () => showDialog(
                                                context: context,
                                                builder: (_) =>
                                                    cubit.defultAlertDialog(
                                                  dates: dates,
                                                  context: context,
                                                  date: 's1',
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 15.0,
                                            ),
                                            MaterialButton(
                                              child: const Text(
                                                "الى",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              shape: const StadiumBorder(),
                                              color: secondColor,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15.0),
                                              onPressed: () => showDialog(
                                                context: context,
                                                builder: (_) =>
                                                    cubit.defultAlertDialog(
                                                  dates: cubit.Dates,
                                                  context: context,
                                                  date: 'e1',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 30.0,
                                        ),
                                        if (isPress)
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              MaterialButton(
                                                child: const Text(
                                                  "من",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                shape: const StadiumBorder(),
                                                color: secondColor,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15.0),
                                                onPressed: () => showDialog(
                                                  context: context,
                                                  builder: (_) =>
                                                      cubit.defultAlertDialog(
                                                    dates: cubit.Dates2,
                                                    context: context,
                                                    date: 's2',
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 15.0,
                                              ),
                                              MaterialButton(
                                                child: const Text(
                                                  "الى",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                shape: const StadiumBorder(),
                                                color: secondColor,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15.0),
                                                onPressed: () => showDialog(
                                                  context: context,
                                                  builder: (_) =>
                                                      cubit.defultAlertDialog(
                                                    dates: cubit.Dates2,
                                                    context: context,
                                                    date: 'e2',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        const SizedBox(
                                          height: 50.0,
                                        ),
                                        Row(
                                          children: [
                                            MaterialButton(
                                              child: const Text(
                                                "حفظ",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              shape: const StadiumBorder(),
                                              color: secondColor,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15.0),
                                              onPressed: () {
                                                cubit.checkDoctor('mon');

                                                isPress = true;

                                                Navigator.pop(context);
                                                // dates = DatesConstant.removeRange(cubit.start1, cubit.end1) ;
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                elevation: 20.0,
                              )
                              .closed
                              .then((value) {
                            cubit.changeBottomSheet(
                                isShow: false, icon: Icons.add);
                          });

                          cubit.changeBottomSheet(
                              isShow: true, icon: Icons.edit);
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Buidsch(
                      day: '  الثلاثاء',
                      icon: cubit.fab,
                      OnPress: () {
                        {
                          isPress=false;
                          cubit.ResetData();
                          scaffoldkey.currentState
                              ?.showBottomSheet(
                                (context) => Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      topRight: Radius.circular(50),
                                    ),
                                    color: KTherdycolor,
                                  ),
                                  padding: const EdgeInsets.all(20.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            MaterialButton(
                                              child: const Text(
                                                "من",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              shape: const StadiumBorder(),
                                              color: secondColor,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15.0),
                                              onPressed: () => showDialog(
                                                context: context,
                                                builder: (_) =>
                                                    cubit.defultAlertDialog(
                                                  dates: dates,
                                                  context: context,
                                                  date: 's1',
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 15.0,
                                            ),
                                            MaterialButton(
                                              child: const Text(
                                                "الى",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              shape: const StadiumBorder(),
                                              color: secondColor,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15.0),
                                              onPressed: () => showDialog(
                                                context: context,
                                                builder: (_) =>
                                                    cubit.defultAlertDialog(
                                                  dates: cubit.Dates,
                                                  context: context,
                                                  date: 'e1',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 30.0,
                                        ),
                                        if (isPress)
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              MaterialButton(
                                                child: const Text(
                                                  "من",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                shape: const StadiumBorder(),
                                                color: secondColor,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15.0),
                                                onPressed: () => showDialog(
                                                  context: context,
                                                  builder: (_) =>
                                                      cubit.defultAlertDialog(
                                                    dates: cubit.Dates2,
                                                    context: context,
                                                    date: 's2',
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 15.0,
                                              ),
                                              MaterialButton(
                                                child: const Text(
                                                  "الى",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                shape: const StadiumBorder(),
                                                color: secondColor,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15.0),
                                                onPressed: () => showDialog(
                                                  context: context,
                                                  builder: (_) =>
                                                      cubit.defultAlertDialog(
                                                    dates: cubit.Dates2,
                                                    context: context,
                                                    date: 'e2',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        const SizedBox(
                                          height: 50.0,
                                        ),
                                        Row(
                                          children: [
                                            MaterialButton(
                                              child: const Text(
                                                "حفظ",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              shape: const StadiumBorder(),
                                              color: secondColor,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15.0),
                                              onPressed: () {
                                                cubit.checkDoctor('tue');

                                                isPress = true;

                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                elevation: 20.0,
                              )
                              .closed
                              .then((value) {
                            cubit.changeBottomSheet(
                                isShow: false, icon: Icons.add);
                          });

                          cubit.changeBottomSheet(
                              isShow: true, icon: Icons.edit);
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Buidsch(
                      day: '  الأربعاء',
                      icon: cubit.fab,
                      OnPress: () {
                        {
                          isPress=false;
                          cubit.ResetData();
                          scaffoldkey.currentState
                              ?.showBottomSheet(
                                (context) => Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      topRight: Radius.circular(50),
                                    ),
                                    color: KTherdycolor,
                                  ),
                                  padding: const EdgeInsets.all(20.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            MaterialButton(
                                              child: const Text(
                                                "من",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              shape: const StadiumBorder(),
                                              color: secondColor,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15.0),
                                              onPressed: () => showDialog(
                                                context: context,
                                                builder: (_) =>
                                                    cubit.defultAlertDialog(
                                                  dates: dates,
                                                  context: context,
                                                  date: 's1',
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 15.0,
                                            ),
                                            MaterialButton(
                                              child: const Text(
                                                "الى",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              shape: const StadiumBorder(),
                                              color: secondColor,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15.0),
                                              onPressed: () => showDialog(
                                                context: context,
                                                builder: (_) =>
                                                    cubit.defultAlertDialog(
                                                  dates: cubit.Dates,
                                                  context: context,
                                                  date: 'e1',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 30.0,
                                        ),
                                        if (isPress)
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              MaterialButton(
                                                child: const Text(
                                                  "من",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                shape: const StadiumBorder(),
                                                color: secondColor,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15.0),
                                                onPressed: () => showDialog(
                                                  context: context,
                                                  builder: (_) =>
                                                      cubit.defultAlertDialog(
                                                    dates: cubit.Dates2,
                                                    context: context,
                                                    date: 's2',
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 15.0,
                                              ),
                                              MaterialButton(
                                                child: const Text(
                                                  "الى",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                shape: const StadiumBorder(),
                                                color: secondColor,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15.0),
                                                onPressed: () => showDialog(
                                                  context: context,
                                                  builder: (_) =>
                                                      cubit.defultAlertDialog(
                                                    dates: cubit.Dates2,
                                                    context: context,
                                                    date: 'e2',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        const SizedBox(
                                          height: 50.0,
                                        ),
                                        Row(
                                          children: [
                                            MaterialButton(
                                              child: const Text(
                                                "حفظ",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              shape: const StadiumBorder(),
                                              color: secondColor,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15.0),
                                              onPressed: () {
                                                cubit.checkDoctor('wed');

                                                isPress = true;

                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                elevation: 20.0,
                              )
                              .closed
                              .then((value) {
                            cubit.changeBottomSheet(
                                isShow: false, icon: Icons.add);
                          });

                          cubit.changeBottomSheet(
                              isShow: true, icon: Icons.edit);
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Buidsch(
                      day: '  الخميس',
                      icon: cubit.fab,
                      OnPress: () {
                        {
                          isPress=false;
                          cubit.ResetData();
                          scaffoldkey.currentState
                              ?.showBottomSheet(
                                (context) => Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      topRight: Radius.circular(50),
                                    ),
                                    color: KTherdycolor,
                                  ),
                                  padding: const EdgeInsets.all(20.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            MaterialButton(
                                              child: const Text(
                                                "من",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              shape: const StadiumBorder(),
                                              color: secondColor,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15.0),
                                              onPressed: () => showDialog(
                                                context: context,
                                                builder: (_) =>
                                                    cubit.defultAlertDialog(
                                                  dates: dates,
                                                  context: context,
                                                  date: 's1',
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 15.0,
                                            ),
                                            MaterialButton(
                                              child: const Text(
                                                "الى",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              shape: const StadiumBorder(),
                                              color: secondColor,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15.0),
                                              onPressed: () => showDialog(
                                                context: context,
                                                builder: (_) =>
                                                    cubit.defultAlertDialog(
                                                  dates: cubit.Dates,
                                                  context: context,
                                                  date: 'e1',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 30.0,
                                        ),
                                        if (isPress)
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              MaterialButton(
                                                child: const Text(
                                                  "من",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                shape: const StadiumBorder(),
                                                color: secondColor,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15.0),
                                                onPressed: () => showDialog(
                                                  context: context,
                                                  builder: (_) =>
                                                      cubit.defultAlertDialog(
                                                    dates: cubit.Dates2,
                                                    context: context,
                                                    date: 's2',
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 15.0,
                                              ),
                                              MaterialButton(
                                                child: const Text(
                                                  "الى",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                shape: const StadiumBorder(),
                                                color: secondColor,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15.0),
                                                onPressed: () => showDialog(
                                                  context: context,
                                                  builder: (_) =>
                                                      cubit.defultAlertDialog(
                                                    dates: cubit.Dates2,
                                                    context: context,
                                                    date: 'e2',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        const SizedBox(
                                          height: 50.0,
                                        ),
                                        Row(
                                          children: [
                                            MaterialButton(
                                              child: const Text(
                                                "حفظ",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              shape: const StadiumBorder(),
                                              color: secondColor,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15.0),
                                              onPressed: () {
                                                cubit.checkDoctor('thu');

                                                isPress = true;

                                                Navigator.pop(context);
                                                // dates = DatesConstant.removeRange(cubit.start1, cubit.end1) ;
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                elevation: 20.0,
                              )
                              .closed
                              .then((value) {
                            cubit.changeBottomSheet(
                                isShow: false, icon: Icons.add);
                          });

                          cubit.changeBottomSheet(
                              isShow: true, icon: Icons.edit);
                        }
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Buidsch(
                      day: '  الجمعة',
                      icon: cubit.fab,
                      OnPress: () {
                        {
                          isPress=false;
                          cubit.ResetData();
                          scaffoldkey.currentState
                              ?.showBottomSheet(
                                (context) => Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      topRight: Radius.circular(50),
                                    ),
                                    color: KTherdycolor,
                                  ),
                                  padding: const EdgeInsets.all(20.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            MaterialButton(
                                              child: const Text(
                                                "من",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              shape: const StadiumBorder(),
                                              color: secondColor,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15.0),
                                              onPressed: () => showDialog(
                                                context: context,
                                                builder: (_) =>
                                                    cubit.defultAlertDialog(
                                                  dates: dates,
                                                  context: context,
                                                  date: 's1',
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 15.0,
                                            ),
                                            MaterialButton(
                                              child: const Text(
                                                "الى",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              shape: const StadiumBorder(),
                                              color: secondColor,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15.0),
                                              onPressed: () => showDialog(
                                                context: context,
                                                builder: (_) =>
                                                    cubit.defultAlertDialog(
                                                  dates: cubit.Dates,
                                                  context: context,
                                                  date: 'e1',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 30.0,
                                        ),
                                        if (isPress)
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              MaterialButton(
                                                child: const Text(
                                                  "من",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                shape: const StadiumBorder(),
                                                color: secondColor,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15.0),
                                                onPressed: () => showDialog(
                                                  context: context,
                                                  builder: (_) =>
                                                      cubit.defultAlertDialog(
                                                    dates: cubit.Dates2,
                                                    context: context,
                                                    date: 's2',
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 15.0,
                                              ),
                                              MaterialButton(
                                                child: const Text(
                                                  "الى",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                shape: const StadiumBorder(),
                                                color: secondColor,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15.0),
                                                onPressed: () => showDialog(
                                                  context: context,
                                                  builder: (_) =>
                                                      cubit.defultAlertDialog(
                                                    dates: cubit.Dates2,
                                                    context: context,
                                                    date: 'e2',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        const SizedBox(
                                          height: 50.0,
                                        ),
                                        Row(
                                          children: [
                                            MaterialButton(
                                              child: const Text(
                                                "حفظ",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              shape: const StadiumBorder(),
                                              color: secondColor,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15.0),
                                              onPressed: () {
                                                cubit.checkDoctor('fri');

                                                isPress = true;

                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                elevation: 20.0,
                              )
                              .closed
                              .then((value) {
                            cubit.changeBottomSheet(
                                isShow: false, icon: Icons.add);
                          });

                          cubit.changeBottomSheet(
                              isShow: true, icon: Icons.edit);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
