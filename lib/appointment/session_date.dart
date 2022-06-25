import 'package:etma2n/shared/component/components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import '../Settings/main_setting_page.dart';
import '../widgets/components.dart';
import '../widgets/constant.dart';
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
    List<String> sessiondates1 = ['1 يوليو','2 يوليو','3 يوليو','4 يوليو','6 يوليو','7 يوليو','9 يوليو','10 يوليو','12 يوليو','13 يوليو','15 يوليو'];
    List<String> sessiondates2 = ['16 يوليو','17 يوليو','18 يوليو','20 يوليو','21 يوليو','22 يوليو','23 يوليو','25 يوليو','27 يوليو','28 يوليو','29 يوليو',];
    late String selectedDate='1 يوليو';

    //var color1=Colors.grey[300];
    bool pressAttention=false;


    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white, //const Color(0xFF5271ff),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios),
              color: KSeconedarycolor,
            ),
            title: const Text(
              'التاريخ',
              style: TextStyle(
                color: Color(0xFF5271ff),
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
                  navigateTo ( context, const SettingScreen());},
                color: KSeconedarycolor,
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
                      crossAxisAlignment:
                      CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder:
                              (BuildContext context, int index) =>
                              MaterialButton(
                                onPressed: () {
                                  //navigateTo(context, SessionTime(docindex: widget.docindex, selectedDuration: widget.selectedDuration, selectedDate: selectedDate, price: widget.price, times: widget.times, result: widget.result));
                                  selectedDate=sessiondates2[index];
                                  if (kDebugMode) {
                                    print(selectedDate);
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: GestureDetector(
                                    onTap: (){
                                      navigateTo(context, SessionTime(docindex: widget.docindex, selectedDuration: widget.selectedDuration, selectedDate: selectedDate, price: widget.price, times: widget.times, result: widget.result));
                                      setState(() => pressAttention = !pressAttention);
                                    },
                                    child: Container(
                                      height: 50,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: pressAttention==false? Colors.grey[300] : Colors.green,
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
                          itemBuilder:
                              (BuildContext context, int index) =>
                              MaterialButton(
                                onPressed: () {
                                  selectedDate=sessiondates2[index];
                                  //navigateTo(context, SessionTime(docindex: widget.docindex, selectedDuration: widget.selectedDuration, selectedDate: selectedDate, price: widget.price, times: widget.times, result: widget.result));
                                  if (kDebugMode) {
                                    print(selectedDate);
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: GestureDetector(
                                    onTap: (){
                                      navigateTo(context, SessionTime(docindex: widget.docindex, selectedDuration: widget.selectedDuration, selectedDate: selectedDate, price: widget.price, times: widget.times, result: widget.result));
                                      setState(() => pressAttention = !pressAttention);
                                    },
                                    child: Container(
                                      height: 50,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: pressAttention==false? Colors.grey[300] : Colors.green,
                                        borderRadius:
                                        BorderRadius.circular(15),
                                      ),
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
                              ),
                          itemCount: sessiondates2.length,
                          separatorBuilder: (context, index) =>
                          const SizedBox(width: 5,),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
/*
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(right: 15, left: 8),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [

              MaterialButton(
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
*/
      ),
    );
  }
}
