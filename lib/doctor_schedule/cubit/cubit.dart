import 'package:etma2n/login/constant/constant.dart';
import 'package:etma2n/model/DoctorModel.dart';
import 'package:etma2n/shared/component/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/DoctorSchudeleModel.dart';
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
  late String StartDate2;
  late String EndDate2;
  late int index;
  List<String> SelectedDates =[];
  List<String> SelectedDatessun =[];
  List<String> SelectedDatesmon =[];
  List<String> SelectedDatestue =[];
  List<String> SelectedDateswed =[];
  List<String> SelectedDatesthu =[];
  List<String> SelectedDatesfri =[];
  List<String> SelectedDatessat =[];
  List<String> SelectedDates2 =[];
  List<String> XDates2 =[];
  List<String> MainDates = DatesConstant;

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
                      style: TextStyle(
                        color: Colors.white
                      ),
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
                        print(start1);
                      }
                      else if (date == 's2') {
                        StartDate2 = dates[i];
                        dates.remove(StartDate2);
                        if(end2 == -1) {
                          start2 = i;
                        } else {
                          start2 = i +1 ;
                        }
                        print(StartDate2);
                      } else if (date == 'e2') {
                        EndDate2 = dates[i];
                        dates.remove(EndDate2);
                        if(start2 == -1) {
                          end2 = i;
                        } else {
                          end2 = i+ 1 ;
                        }
                        print(EndDate2);
                       // print(end1);
                      } else if (date == 'e1') {
                        EndDate = dates[i];
                        dates.remove(EndDate);
                        if(start1 == -1) {
                          end1 = i;
                        } else {
                          end1 = i+ 1 ;
                        }
                        print(EndDate);
                        print(end1);
                      }
                      Navigator.of(context).pop();
                    },
                  ),
                ),
            ],
          ),
        ),
      );

  void checkDoctor(String day) {
    if(isPress==false){
      isPress= true;
      print(SelectedDates);
    SelectedDates = MainDates.getRange(start1, end1-1).toList();
    SelectedDates.add(EndDate);
    Dates2.removeRange(start1, end1);
    XDates2 = Dates2;
    SelectedDates.insert (0,StartDate);
    print(SelectedDates);
    print(SelectedDates);
    index = SelectedDates.length;
    }
    else{
      SelectedDates2 = XDates2.getRange(start2, end2-1).toList();
      print(SelectedDates2);
      SelectedDates.add(StartDate2);
      SelectedDates.addAll(SelectedDates2);
      SelectedDates.add(EndDate2);
      print(SelectedDates);
      print(SelectedDates);
    }
    if(day=='sat'){
      SelectedDatessat = SelectedDates;
      SaveData('الاء صلاح','sat',SelectedDatessat );
    }
    else if(day=='sun') {
      SelectedDatessun = SelectedDates;
      SaveData('الاء صلاح','sun',SelectedDatessun );
    } else if(day=='mon') {
      SelectedDatesmon = SelectedDates;
      SaveData('الاء صلاح','mon',SelectedDatesmon );
    } else if(day=='tue') {
      SelectedDatestue = SelectedDates;
      SaveData('الاء صلاح','tue',SelectedDatestue );
    } else if(day=='wed') {
      SelectedDateswed = SelectedDates;
      SaveData('الاء صلاح','wed',SelectedDateswed );
    } else if(day=='thu') {
      SelectedDatesthu = SelectedDates;
      SaveData('الاء صلاح','thu',SelectedDatesthu );
    } else if(day=='fri') {
      SelectedDatesfri = SelectedDates;
      SaveData('الاء صلاح','fri',SelectedDatesfri );
    }
    emit(DoctorSchedulSecondDateState());
  }



  void SaveData(String DocName,String day, List<String> dates){

    DoctorDates(
      DocName,
      day,
      dates,
    );
  }



  void ResetData() {
        end1=-1;
        start1=-1;
        start2=-1;
        end2=-1;
        SelectedDates =[];
        Dates = DatesConstant;
        Dates2 = DatesConstant;
        isPress = false;
        emit(DoctorSchedulSecondDateState());
  }
}
