import 'package:etma2n/Settings/main_setting_page.dart';
import 'package:etma2n/shared/component/components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import '../models/doctors_model.dart';
import '../widgets/components.dart';
import '../widgets/constant.dart';
import 'about_appointment.dart';

class SessionTime extends StatefulWidget {
  static String id = 'SessionTime';
  final int docindex;
  final String selectedDuration;
  final int price;
  final int result;
  final String times;
  final String selectedDate;

  const SessionTime(
      {Key? key,
      required this.docindex,
      required this.selectedDuration,
      required this.selectedDate,
      required this.price,
      required this.times,
      required this.result})
      : super(key: key);

  @override
  _SessionTimeState createState() => _SessionTimeState();
}

class _SessionTimeState extends State<SessionTime> {
  @override
  Widget build(BuildContext context) {
    //double height1 = MediaQuery.of(context).size.height;
    //double width1 = MediaQuery.of(context).size.width;

    late String selectedTime = "00:00";

    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(

          title: const Text(
            'الموعد',

          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.settings,
              ),
              onPressed: () {
                navigateTo(context, const SettingScreen());
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) =>
                              MaterialButton(
                            onPressed: () {
                              navigateTo(
                                  context,
                                  AboutAppointment(
                                    docindex: widget.docindex,
                                    selectedDuration: widget.selectedDuration,
                                    selectedDate: widget.selectedDate,
                                    price: widget.price,
                                    times: widget.times,
                                    selectedTime: selectedTime,
                                  ));
                              selectedTime =
                                  doctor[widget.docindex].doctime1[index];
                              if (kDebugMode) {
                                print(selectedTime);
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Container(
                                width: 150,
                                height: 50,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Center(
                                  child: Text(
                                    doctor[widget.docindex].doctime1[index],
                                    style: const TextStyle(
                                      color: Colors.indigoAccent,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          itemCount: doctor[widget.docindex].doctime1.length,
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    //fit: FlexFit.loose,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) =>
                              MaterialButton(
                            onPressed: () {
                              //navigateTo(context, AboutAppointment(docindex: widget.docindex, selectedDuration: widget.selectedDuration, selectedDate: widget.selectedDate, price: widget.price, times: widget.times, selectedTime: selectedTime,));
                              selectedTime =
                                  doctor[widget.docindex].doctime2[index];
                              if (kDebugMode) {
                                print(selectedTime);
                              }
                            },
                            child: GestureDetector(
                              onTap: () {
                                navigateTo(
                                    context,
                                    AboutAppointment(
                                      docindex: widget.docindex,
                                      selectedDuration: widget.selectedDuration,
                                      selectedDate: widget.selectedDate,
                                      price: widget.price,
                                      times: widget.times,
                                      selectedTime: selectedTime,
                                    ));
                                selectedTime =
                                    doctor[widget.docindex].doctime2[index];
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  width: 150,
                                  height: 50,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Center(
                                    child: Text(
                                      doctor[widget.docindex].doctime2[index],
                                      style: const TextStyle(
                                        color: Colors.indigoAccent,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          itemCount: doctor[widget.docindex].doctime2.length,
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

      ),
    );
  }
}
