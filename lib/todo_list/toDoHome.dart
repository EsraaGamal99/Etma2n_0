import 'package:conditional_builder/conditional_builder.dart';
import 'package:etma2n/login/constant/constant.dart';
import 'package:etma2n/shared/component/components.dart';
import 'package:etma2n/todo_list/cubit/cubit.dart';
import 'package:etma2n/todo_list/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

import 'package:sqflite/sqflite.dart';

class TodoHomeScreen extends StatelessWidget {
  var scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();
  var timecontroller = TextEditingController();
  var datecontroller = TextEditingController();
  var titelecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ToDoCubit()..creatdb(),
      child: BlocConsumer<ToDoCubit, ToDostates>(
        listener: (BuildContext context, ToDostates state) {
          if (state is ToDoInsertDB) {
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, ToDostates state) {
          return Directionality(
            textDirection: ui.TextDirection.rtl,
            child: Scaffold(
              key: scaffoldkey,
              appBar: AppBar(
                // backgroundColor: Colors.purpleAccent ,
                title: Text(
                  ToDoCubit.get(context)
                      .title[ToDoCubit.get(context).currentindex],
                ),
              ),
              body: ConditionalBuilder(
                condition: state is! ToDoGetDBloadingstate,
                builder: (context) => ToDoCubit.get(context)
                    .screens[ToDoCubit.get(context).currentindex],
                fallback: (context) =>
                    const Center(child: CircularProgressIndicator()),
              ),
              floatingActionButton: FloatingActionButton(
                // backgroundColor: Colors.purpleAccent,
                onPressed: () {
                  if (ToDoCubit.get(context).isBottomSheetShow) {
                    if (formkey.currentState!.validate()) {
                      ToDoCubit.get(context).insertdb(
                          title: titelecontroller.text,
                          time: timecontroller.text,
                          date: datecontroller.text);
                    }
                  } else {
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
                      ToDoCubit.get(context)
                          .changeBottomsheet(isShow: false, icon: Icons.edit);
                    });
                    ToDoCubit.get(context)
                        .changeBottomsheet(isShow: true, icon: Icons.add);
                  }
                },
                child: Icon(
                  ToDoCubit.get(context).fab,
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                //backgroundColor: Colors.purpleAccent,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.list_sharp,
                    ),
                    label: 'المهام الحالية',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.check_circle_outline_rounded,
                    ),
                    label: 'تم',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.archive_outlined,
                    ),
                    label: 'ارشيف',
                  ),
                ],
                unselectedItemColor: Colors.black45,
                //selectedItemColor: Colors.purpleAccent,
                type: BottomNavigationBarType.fixed,
                currentIndex: ToDoCubit.get(context).currentindex,
                onTap: (index) {
                  ToDoCubit.get(context).changeIndex(index);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
