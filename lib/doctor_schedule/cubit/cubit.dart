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

  IconData fab = Icons.edit;

  String selectedDate= '';
  List<String> dates = [
    '',
    '12:00 AM',
    '12:30 AM',
    '1:00 AM',
    '1:30 AM',
    '12:00 AM',
    '12:00 AM',
    '12:00 AM',

  ];

  void changeBottomSheet({
    required bool isShow,
    required IconData icon,
  }) {
    isBottomSheetShow = isShow;
    fab = icon;
    emit(DoctorScheduleChangeBottomState());
  }

}

