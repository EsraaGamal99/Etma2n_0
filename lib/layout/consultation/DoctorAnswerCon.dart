import 'package:etma2n/doctor_profile.dart';
import 'package:etma2n/layout/consultation/Doctor_Questions_View.dart';
import 'package:etma2n/shared/component/components.dart';
import 'package:flutter/material.dart';

class DoctorAnswerCon extends StatelessWidget {
  final String ConQuestion;

  DoctorAnswerCon(this.ConQuestion);

  @override
  Widget build(BuildContext context) {
    var newConsController = TextEditingController();
    Color mainColor = const Color(0xffa9c1f7);
    Color secondColor = const Color(0xff576dca);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: secondColor,
                                width: 4,
                              )),
                          child: Text(
                            ConQuestion,
                            style: const TextStyle(
                              // color: ,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                            /*maxLines: 2,
                            overflow: TextOverflow.ellipsis,*/
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                          context,
                          controller: newConsController,
                          type: TextInputType.text,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return "الإجابة فارغة";
                            }
                            return null;
                          },
                          label: 'اكتب الإجابة',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              MaterialButton(
                shape: const StadiumBorder(),
                color: secondColor,
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                //بكتب الفانكشن اللى هتخزن وتبعت السؤال للدكتور
                onPressed: () {
                  navigateTo(context, ConsQuestionHome());
                },
                child: const Text(
                  'ارسال',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}