import 'package:etma2n/shared/component/components.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import '../widgets/components.dart';
import 'session_time.dart';

class SessionDate extends StatefulWidget {
  static String id = 'SessionDate';
  final int docindex;
  final String selectedDuration;
  final int price;
  final int result;
  final String times;


  const SessionDate({Key? key, required this.docindex, required this.selectedDuration, required this.price, required this.times, required this.result,}) : super(key: key);


  @override
  _SessionDateState createState() => _SessionDateState();
}

class _SessionDateState extends State<SessionDate> {
  @override
  Widget build(BuildContext context) {
    //double height1 = MediaQuery.of(context).size.height;
    //double width1 = MediaQuery.of(context).size.width;
    List<String> sessiondates1 = ['1 يونيو','2 يونيو','3 يونيو','4 يونيو','6 يونيو','7 يونيو','9 يونيو','10 يونيو','11 يونيو','12 يونيو','13 يونيو','15 يونيو'];
    List<String> sessiondates2 =['16 يونيو','17 يونيو','18 يونيو','20 يونيو','21 يونيو','22 يونيو','23 يونيو','25 يونيو','26 يونيو','27 يونيو','28 يونيو','29 يونيو',];
    late String selectedDate;

    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF5271ff),
            title: const Text(
              'التاريخ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.menu,
                ),
                onPressed: () {
                  print('setting opened');
                },
                color: Colors.white,
              ),
            ],
          ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment:
                      CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder:
                              (BuildContext context, int index) =>
                              FlatButton(
                                onPressed: () {
                                  selectedDate=sessiondates2[index];
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    //width: 150,
                                    height: 50,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius:
                                      BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child: Text(
                                        sessiondates1[index],
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
                          itemCount: sessiondates1.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 5,),
                        ),
                      ],
                    ),),
                  Expanded(
                    //fit: FlexFit.loose,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment:
                      CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) => Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                              //width: 100,
                              height: 50,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius:
                                BorderRadius.circular(15),
                              ),
                              child: FlatButton(
                                onPressed: () {
                                  selectedDate=sessiondates1[index];
                                },
                                child: Center(
                                  child: Text(
                                    sessiondates2[index],
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
                          itemCount: sessiondates2.length,
                          separatorBuilder: (context, index) =>
                              const SizedBox(
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
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(right: 15, left: 8),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [

              FlatButton(
                onPressed: () {
                  navigateTo ( context, SessionTime(
                      docindex: widget.docindex, price: widget.price,
                      selectedDuration: widget.selectedDuration ,result: widget.result,
                        selectedDate: selectedDate,times: widget.times,),);
                },
                color: Colors.indigoAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: const [
                    Text(
                      'التالي',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 18.5,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.download_done_outlined,
                      color: Colors.white,
                      // size: 15,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Expanded(
                child: Text(
                  '${widget.result} ج.م / ${widget.selectedDuration}',
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: Colors.indigoAccent),
                  // maxLines: 2,
                  // overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
