import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import '../models/doctors_model.dart';
import '../widgets/components.dart';
import 'payment_page.dart';


class AboutAppointment extends StatefulWidget {
  static String id = 'AboutAppointment';
  final int docindex;
  final String selectedDuration;
  final int price;
  final String selectedDate;
  final String times;
  final String selectedTime;

  const AboutAppointment({Key? key, required this.docindex, required this.selectedDuration, required this.price, required this.selectedDate, required this.selectedTime,
     required this.times}) : super(key: key);
  @override
  _AboutAppointmentState createState() => _AboutAppointmentState();
}

class _AboutAppointmentState extends State<AboutAppointment> {
  @override
  Widget build(BuildContext context) {

    //double height1 = MediaQuery.of(context).size.height;
    //double width1 = MediaQuery.of(context).size.width;

    double faces=((widget.price/100)*15);
    double discount=0.0;
    double total=widget.price+faces;
    print(widget.times);
    late String Times;
    var   code = TextEditingController();

    if(widget.times=='1') {
      Times='جلسة واحدة';
    } else if(widget.times=='2') {
      Times='جلستان';
    } else {
      Times='${widget.times} جلسات';
    }

    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'تقرير',
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
                print('setting opened');
              },
              color: Colors.white,
            ),
          ],
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                //discount code
                GestureDetector(
                  onTap: () {

                  },
                  child: Container(
                    height: 66,
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade50,
                      borderRadius: BorderRadius.circular(11.0,),
                    ),
                    padding: const EdgeInsets.only(right: 44),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customTextField(
                            controller: code,
                            type: TextInputType.text,
                            icon: Icons.local_offer,
                            hint: 'ادخل الكود'),
                        const Spacer(),
                        GestureDetector(
                          onTap: (){
                            discount = (widget.price/100)*10;
                            total=widget.price+faces-discount;
                          },
                          child: Container(
                            padding: const EdgeInsets.only(left: 44,right: 11),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade500,
                              borderRadius: BorderRadius.circular(11.0,),
                            ),
                            child: const Center(
                              child: Text(
                                'تطبيق الكود',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 15,),
                    //التكلفة
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 44,top: 10,bottom: 10),
                            child: Text(
                              'التكلفة',
                              style: TextStyle(
                                color: Colors.indigoAccent,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 24,top: 10,bottom: 10),
                            child: Text(
                              '${widget.price}',
                              style: const TextStyle(
                                color: Colors.indigoAccent,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15,),
                    //discount
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 44,top: 10,bottom: 20),
                            child: Text(
                              'الخصم',
                              style: TextStyle(
                                color: Colors.indigoAccent,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10,bottom: 20),
                            child: Text(
                              '$discount',
                              style: const TextStyle(
                                color: Colors.indigoAccent,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    //الضريبة
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 44,top: 10,bottom: 20),
                            child: Text(
                              'الضريبة',
                              style: TextStyle(
                                color: Colors.indigoAccent,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10,bottom: 20),
                            child: Text(
                              '$faces',
                              style: const TextStyle(
                                color: Colors.indigoAccent,
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20,),

                //total
                Container(
                  decoration: BoxDecoration(
                    color: Colors.indigo.shade50,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.only(right: 44, left: 24, top: 3,bottom: 3),
                  //height: 35,
                  width: 330,
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'الإجمالي',
                          style: TextStyle( color: Colors.black54,fontWeight: FontWeight.w500),
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        child: Text(
                          '$total',
                          style: const TextStyle( color: Colors.black54,fontWeight: FontWeight.w500),

                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'يوجد 15% ضريبة القيمة المضافة',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 15,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15,),
                myLine(Colors.grey[300]!),

                //doctor
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20,top: 10,bottom: 10),
                      child: Text(
                        'دكتور الجلسة  :  ${doctor[widget.docindex].docname}',
                        style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                
                // عدد الجلسات
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20,top: 10,bottom: 10),
                      child: Text(
                        'عدد الجلسات   :   $Times',
                        style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),

                //date
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20,top: 10,bottom: 10),
                      child: Text(
                        'تاريخ الجلسة   :   ${widget.selectedDate}',
                        style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),

                //time
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20,top: 10,bottom: 10),
                      child: Text(
                        'معاد الجلسة   :   ${widget.selectedTime}',
                        style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),


                const SizedBox(height: 44,),
                // next
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                      height: 50,
                      minWidth: 100,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => PaymentPage(),),);
                      },
                      color: Colors.indigoAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: const [
                          Text(
                            'الدفع',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 18.5,
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
      ),
    );
  }
}
