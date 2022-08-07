import 'package:etma2n/shared/component/components.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import '../Settings/main_setting_page.dart';
import '../models/doctors_model.dart';
import '../shared/styles/colors.dart';
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
    late var codecontroller = TextEditingController();
    //double height1 = MediaQuery.of(context).size.height;
    //double width1 = MediaQuery.of(context).size.width;

    double faces=((widget.price/100)*15);
    double discount=0.0;
    double total=widget.price+faces;
    //print(widget.times);
    late String times,code;

    if(widget.times=='1') {
      times='جلسة واحدة';
    } else if(widget.times=='2') {
      times='جلستان';
    } else {
      times='${widget.times} جلسات';
    }

    return Directionality(
      textDirection: ui.TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: KSeconedarycolor,
          ),
          title: const Text(
            'تقرير',

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
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // //discount code
                // Container(
                //   height: 66,
                //   decoration: BoxDecoration(
                //     color: Colors.indigo.shade50,
                //     borderRadius: BorderRadius.circular(11.0,),
                //   ),
                //   padding: const EdgeInsets.only(right: 44),
                //   child: Row(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       /*customTextField(
                //           icon: Icons.local_offer,
                //           hint: 'ادخل الكود',
                //         validate: (String value) {
                //           if (value.isEmpty) {
                //             return 'الكود فارغ';
                //           }
                //           return null;
                //         },
                //         controle: codecontroller,
                //         keyboard: TextInputType.number,
                //       ),*/
                //
                //       const Spacer(),
                //       GestureDetector(
                //         onTap: (){
                //           discount = (widget.price/100)*10;
                //           total=widget.price+faces-discount;
                //         },
                //         child: Container(
                //           padding: const EdgeInsets.only(left: 44,right: 11),
                //           decoration: BoxDecoration(
                //             color: Colors.grey.shade500,
                //             borderRadius: BorderRadius.circular(11.0,),
                //           ),
                //           child: const Center(
                //             child: Text(
                //               'تطبيق الكود',
                //               style: TextStyle(color: Colors.white),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                //
                // const SizedBox(height: 20,),
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
                   /* Row(
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
                    ),*/
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
                const SizedBox(height: 15,),
                myLine(Colors.grey[300]!),

                //doctor
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20,top: 10,bottom: 10),
                      child: Text(
                        'دكتور الجلسة  :  ${doctor[widget.docindex].docname}',
                        style: Theme.of(context).textTheme.bodyText2,
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
                        'عدد الجلسات   :   $times',
                        style:  Theme.of(context).textTheme.bodyText2,
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
                        style:  Theme.of(context).textTheme.bodyText2,
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
                        style:  Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  ],
                ),


                const SizedBox(height: 44,),
                // next
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      height: 50,
                      minWidth: 100,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const PaymentPage(),),);
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
