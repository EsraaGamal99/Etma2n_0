import 'package:bloc/bloc.dart';
import 'package:etma2n/todo_list/archivedtasks/archivedtask.dart';
import 'package:etma2n/todo_list/donetask/donetask.dart';
import 'package:etma2n/todo_list/newtask/newtask.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import 'states.dart';

class DoctorScheduleCubit extends Cubit<DoctorScheduleStates> {
  DoctorScheduleCubit() : super(DoctorScheduleInitialState());

  static DoctorScheduleCubit get(context) => BlocProvider.of(context);

  bool isBottomSheetShow = false;

  IconData fab = Icons.add;

  void changeBottomSheet({
    required bool isShow,
    required IconData icon,
  }) {
    isBottomSheetShow = isShow;
    fab = icon;
    emit(DoctorScheduleChangeBottomState());
  }

  List<String> dates = [
    '12:00 AM',
    '12:30 AM',
    '1:00 AM',
    '1:30 AM',
    '2:00 AM',
    '2:30 AM',
    '3:00 AM',
    '3:30 AM',
    '4:00 AM',
    '4:30 AM',
    '5:00 AM',
    '5:30 AM',
    '6:00 AM',
    '6:30 AM',
    '7:00 AM',
    '7:30 AM',
    '8:00 AM',
    '8:30 AM',
    '9:00 AM',
    '9:30 AM',
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
    '12:00 PM',
    '12:30 PM',
    '1:00 PM',
    '1:30 PM',
    '2:00 PM',
    '2:30 PM',
    '3:00 PM',
    '3:30 PM',
    '4:00 PM',
    '4:30 PM',
    '5:00 PM',
    '5:30 PM',
    '6:00 PM',
    '6:30 PM',
    '7:00 PM',
    '7:30 PM',
    '8:00 PM',
    '8:30 PM',
    '9:00 PM',
    '9:30 PM',
    '10:00 PM',
    '10:30 pM',
    '11:00 pM',
    '11:30 PM',
  ];
  late String StartDate;
  late String EndDate;
  bool isPress = false ;

  void addRow(){
    isPress = true;
    emit(DoctorScheduleAddRow());
  }
}
