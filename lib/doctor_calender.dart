import 'package:etma2n/login/constant/constant.dart';
import 'package:flutter/material.dart';


class DoctorCalender extends StatefulWidget {
  const DoctorCalender({Key? key}) : super(key: key);

  @override
  State<DoctorCalender> createState() => _DoctorCalenderState();
}

class _DoctorCalenderState extends State<DoctorCalender> {
  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      appBar: AppBar(),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            child: const Text(
              "Start Date",
            ),
            shape: const StadiumBorder(),
            color: KButtomcolor,
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            onPressed: () => showDialog(
              context: context,
              builder: (_) => AlertDialog(
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
                              StartDate = dates[i];
                              dates.remove(StartDate);
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                    ],
                  ),
                ),
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
            color: KButtomcolor,
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            onPressed: () => showDialog(
              context: context,
              builder: (_) => AlertDialog(
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
                              EndDate = dates[i];
                              dates.remove(EndDate);
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () => showDialog(
          context: context,
          builder: (_) => AlertDialog(
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
                          StartDate = dates[i];
                          dates.remove(StartDate);
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
