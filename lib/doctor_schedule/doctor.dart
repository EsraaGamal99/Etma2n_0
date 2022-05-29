import 'package:etma2n/login/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shared/component/components.dart';
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
  bool isPress = false;
  late String StartDate;
  late int start ;
  late int end;
  late String EndDate;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorScheduleCubit, DoctorScheduleStates>(
      listener: (context, state) {},
      builder: (context, state){
        var cubit = DoctorScheduleCubit.get(context);
        var dates = cubit.dates ;
        return Directionality(
        textDirection: ui.TextDirection.rtl,
        child: Scaffold(
          key: scaffoldkey,
          appBar: AppBar(
            title: const Text(
              'مواعيد الدكتور',
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    height: 70.0,
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF5271ff), Colors.black12],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            const Text(
                              ' السبت',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 30.0,
                            ),
                            const Expanded(
                              child: Text(
                                'اليوم اجازة',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white54,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: Icon(
                                cubit.fab,
                                color: Colors.white,
                              ),
                              // backgroundColor: Colors.purpleAccent,
                              onPressed: () {
                                {
                                  scaffoldkey.currentState
                                      ?.showBottomSheet(
                                        (context) => Container(

                                          color: Color(0xffa9c1f7),
                                          padding: const EdgeInsets.all(20.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    MaterialButton(
                                                      child: const Text(
                                                        "Start Date",
                                                      ),
                                                      shape: const StadiumBorder(),
                                                      color: Colors.white,
                                                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                                                      onPressed: () => showDialog(
                                                        context: context,
                                                        builder: (_) => defultAlertDialog(
                                                          dates: cubit.dates,
                                                          context: context,
                                                          date: 's',
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 15.0,
                                                    ),
                                                    MaterialButton(
                                                      child: const Text(
                                                        "End Date",
                                                      ),
                                                      shape: const StadiumBorder(),
                                                      color: Colors.white,
                                                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                                                      onPressed: () => showDialog(
                                                        context: context,
                                                        builder: (_) => defultAlertDialog(
                                                          dates: cubit.dates,
                                                          context: context,
                                                          date: 'e',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 30.0,),

                                                if(isPress)
                                                  Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      MaterialButton(
                                                        child: const Text(
                                                          "Start Date",
                                                        ),
                                                        shape: const StadiumBorder(),
                                                        color: Colors.white,
                                                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                                                        onPressed: () => showDialog(
                                                          context: context,
                                                          builder: (_) => defultAlertDialog(
                                                            dates: cubit.dates,
                                                            context: context,
                                                            date: 's',
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 15.0,
                                                      ),
                                                      MaterialButton(
                                                        child: const Text(
                                                          "End Date",
                                                        ),
                                                        shape: const StadiumBorder(),
                                                        color: Colors.white,
                                                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                                                        onPressed: () => showDialog(
                                                          context: context,
                                                          builder: (_) => defultAlertDialog(
                                                            dates: cubit.dates,
                                                            context: context,
                                                            date: 'e',
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                const SizedBox(height: 50.0,),

                                                FloatingActionButton(onPressed: (){
                                                  setState(() {
                                                    isPress= true;
                                                  });

                                                },child: Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                ),),
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
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 70.0,
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF5271ff), Colors.black12],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            const Text(
                              ' الاحد',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 30.0,
                            ),
                            const Expanded(
                              child: Text(
                                'اليوم اجازة',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white54,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                              ),
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 70.0,
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF5271ff), Colors.black12],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            const Text(
                              ' الاثنين',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 30.0,
                            ),
                            const Expanded(
                              child: Text(
                                'اليوم اجازة',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white54,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                              ),
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 70.0,
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF5271ff), Colors.black12],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            const Text(
                              ' الثلاثاء',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 30.0,
                            ),
                            const Expanded(
                              child: Text(
                                'اليوم اجازة',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white54,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                              ),
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 70.0,
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF5271ff), Colors.black12],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            const Text(
                              ' الاربعاء',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 30.0,
                            ),
                            const Expanded(
                              child: Text(
                                'اليوم اجازة',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white54,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                              ),
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 70.0,
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF5271ff), Colors.black12],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            const Text(
                              ' الخميس',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 30.0,
                            ),
                            const Expanded(
                              child: Text(
                                'اليوم اجازة',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white54,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                              ),
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 70.0,
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF5271ff), Colors.black12],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            const Text(
                              ' الجمعة',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 30.0,
                            ),
                            const Expanded(
                              child: Text(
                                'اليوم اجازة',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white54,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                              ),
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
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
