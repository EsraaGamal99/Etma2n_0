import 'package:etma2n/login/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../shared/component/components.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class Doctor extends StatefulWidget {
  const Doctor({Key? key}) : super(key: key);

  @override
  _DoctorState createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();
  var timecontroller = TextEditingController();
  var datecontroller = TextEditingController();
  var titelecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorScheduleCubit, DoctorScheduleStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = DoctorScheduleCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'واعيد الدكتور',
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
                            IconButton(onPressed: () {
                              scaffoldkey.currentState!
                                  .showBottomSheet(
                                    (context) => Container(
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(20.0),
                                  child: SingleChildScrollView(
                                    child: Form(
                                      key: formkey,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          DropdownButton<String>(
                                            //iconEnabledColor: KSeconedarycolor,
                                            value: cubit.selectedDate,
                                            elevation: 10,
                                            icon: const Icon(
                                              Icons.arrow_drop_down,
                                              color: KSeconedarycolor,
                                            ),
                                            onChanged: (String? newValue) {
                                                cubit.selectedDate = newValue!;
                                            },
                                            underline: SizedBox(),
                                            items: cubit.dates
                                                .map<DropdownMenuItem<String>>((String value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList(),
                                          ),

                                          defaulttaskFormField(
                                            controller: titelecontroller,
                                            type: TextInputType.text,
                                            validate: (String value) {
                                              if (value.isEmpty) {
                                                return 'الاسم فارغ';
                                              }
                                              return null;
                                            },
                                            label: 'اسم المهمه',
                                            prefix: Icons.task_alt_rounded,
                                          ),
                                          const SizedBox(
                                            height: 15.0,
                                          ),
                                          defaulttaskFormField(
                                            controller: timecontroller,
                                            type: TextInputType.datetime,
                                            validate: (String value) {
                                              if (value.isEmpty) {
                                                return 'الوقت فارغ';
                                              }
                                              return null;
                                            },
                                            onTap: () {
                                              showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now(),
                                              ).then((value) {
                                                timecontroller.text =
                                                    value!.format(context).toString();
                                                print(value.format(context));
                                              });
                                            },
                                            label: ' وقت المهمه',
                                            prefix: Icons.watch_later_outlined,
                                          ),
                                          const SizedBox(
                                            height: 15.0,
                                          ),
                                          defaulttaskFormField(
                                            controller: datecontroller,
                                            type: TextInputType.datetime,
                                            validate: (String value) {
                                              if (value.isEmpty) {
                                                return 'التاريخ فارغ';
                                              }
                                              return null;
                                            },
                                            onTap: () {
                                              showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime.now(),
                                                lastDate:
                                                DateTime.parse('2028-12-01'),
                                              ).then((value) {
                                                datecontroller.text =
                                                    DateFormat.yMMMd().format(value!);
                                              });
                                            },
                                            label: 'تاريخ المهمه',
                                            prefix: Icons.calendar_today_outlined,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                elevation: 20.0,
                              )
                                  .closed
                                  .then((value) {
                                DoctorScheduleCubit.get(context)
                                    .changeBottomSheet(isShow: false, icon: Icons.edit);
                              });
                              cubit
                                  .changeBottomSheet(isShow: true, icon: Icons.add);

                            },
                              icon: const Icon(
                                Icons.add,
                              ),
                              color: Colors.white,),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0,),
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
                              ' لاحد',
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
                            IconButton(onPressed: (){}, icon: const Icon(
                              Icons.add,
                            ),
                              color: Colors.white,),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0,),
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
                            IconButton(onPressed: (){}, icon: const Icon(
                              Icons.add,
                            ),
                              color: Colors.white,),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0,),
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
                            IconButton(onPressed: (){}, icon: const Icon(
                              Icons.add,
                            ),
                              color: Colors.white,),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0,),
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
                            IconButton(onPressed: (){}, icon: const Icon(
                              Icons.add,
                            ),
                              color: Colors.white,),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0,),
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
                            IconButton(onPressed: (){}, icon: const Icon(
                              Icons.add,
                            ),
                              color: Colors.white,),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0,),
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
                            IconButton(onPressed: (){}, icon: const Icon(
                              Icons.add,
                            ),
                              color: Colors.white,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );



  }
}
