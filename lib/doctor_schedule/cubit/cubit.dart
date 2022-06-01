import 'package:bloc/bloc.dart';
import 'package:etma2n/login/constant/constant.dart';
import 'package:etma2n/shared/component/constants.dart';
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

  List<String> Dates = DatesConstant;

  bool isPress = false;

  void addRow() {
    isPress = true;
    emit(DoctorScheduleAddRow());
  }

  late int start1;
  late int start2;
  late int end1;
  late int end2;
  late String StartDate;

  late String EndDate;

  Widget defultAlertDialog({
    required List<String> dates,
    required context,
    required String date,

  }) =>
      AlertDialog(
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Choose Date',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 15),
              for (int i = 0; i < dates.length; i++)
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 15.0),
                  child: MaterialButton(
                    shape: const StadiumBorder(),
                    color: KButtomcolor,
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(
                      dates[i],
                    ),
                    onPressed: () {
                      if (date == 's1') {
                        StartDate = dates[i];
                        dates.remove(StartDate);
                        start1 = i;

                      }
                      else if (date == 's2') {
                        StartDate = dates[i];
                        dates.remove(StartDate);
                        start2 = i;
                      }
                      else if (date == 'e2') {
                        EndDate = dates[i];
                        dates.remove(EndDate);
                        end2 = i;
                      }
                      else if (date == 'e1') {
                        EndDate = dates[i];
                        dates.remove(EndDate);
                        end1 = i;
                      }
                      Navigator.of(context).pop();
                    },
                  ),
                ),
            ],
          ),
        ),
      );

  void checkDoctor(List<String> date) {
     //Dates = DatesConstant.removeRange(start1, end1) ;


  }

}
