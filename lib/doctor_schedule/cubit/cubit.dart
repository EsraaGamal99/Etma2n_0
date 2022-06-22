import 'package:etma2n/login/constant/constant.dart';
import 'package:etma2n/shared/component/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  List<String> Dates2 = DatesConstant;

  bool isPress = false;

  void addRow() {
    isPress = true;
    emit(DoctorScheduleAddRow());
  }

   int start1 = -1;
   int start2 = -1;
   int end1 = -1;
   int end2 = -1;
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
                        if(end1 == -1) {
                          start1 = i;
                        } else {
                          start1 = i +1 ;
                        }

                        print(StartDate);
                      } else if (date == 's2') {
                        StartDate = dates[i];
                        dates.remove(StartDate);
                        start2 = i;

                        print(StartDate);
                      } else if (date == 'e2') {
                        EndDate = dates[i];
                        dates.remove(EndDate);
                        end2 = i;
                        print(EndDate);
                      } else if (date == 'e1') {
                        EndDate = dates[i];
                        dates.remove(EndDate);
                        if(start1 == -1) {
                          end1 = i;
                        } else {
                          end1 = i+ 1 ;
                        }
                        print(EndDate);
                      }
                      Navigator.of(context).pop();
                    },
                  ),
                ),
            ],
          ),
        ),
      );

  void checkDoctor() {

    Dates2.removeRange(start1, end1);
    emit(DoctorSchedulSecondDateState());
  }
}
