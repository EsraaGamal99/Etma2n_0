import 'package:etma2n/doctor_schedule/cubit/cubit.dart';
import 'package:etma2n/doctor_schedule/cubit/states.dart';
import 'package:etma2n/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class doc extends StatelessWidget {
  const doc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorScheduleCubit, DoctorScheduleStates>(
    listener: (context, state) {},
    builder: (context, state) {
    var cubit = DoctorScheduleCubit.get(context);
    var dates = cubit.Dates;
    Color secondColor = const Color(0xff576dca);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int i = 0; i < cubit.SelectedDates.length; i++)
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 15.0),
                child: MaterialButton(
                  shape: const StadiumBorder(),
                  color: KButtomcolor,
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  onPressed: () {  },
                  child: Text(
                    cubit.SelectedDates[i],
                  ),

                ),
              ),
          ],
        ),
      ),
    );}
    );
  }
}
