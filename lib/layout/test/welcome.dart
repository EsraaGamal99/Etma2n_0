import 'package:etma2n/data/depressionq_qestions.dart';
import 'package:etma2n/data/ocd_questions.dart';
import 'package:etma2n/data/question_list1.dart';
import 'package:etma2n/layout/test/cubit/cubit.dart';
import 'package:etma2n/layout/test/cubit/states.dart';
import 'package:etma2n/shared/component/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'test_screen.dart';

class Welcom extends StatelessWidget {
  final String testName;

  Welcom(this.testName);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TestCubit, TestStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = TestCubit.get(context);
        return Scaffold(
          backgroundColor: const Color(0xffa9c1f7),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 48.0,
              horizontal: 12.0,
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        testName,
                        style: const TextStyle(
                          color: Color(0xff576dca),
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "برجاء قراءة جمل الاختبار واختيار الإجابة الأنسب لك خلال الأسبوعين الماضيين.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 26.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Expanded(
                    child: Center(
                      child: RawMaterialButton(
                        onPressed: () {
                          cubit.resultScore = 0;
                          cubit.totalResult =0;
                          if (cubit.testIndex == 0) {
                            navigateTo(context,QuizScreen(depressionqQestions));
                          } else if (cubit.testIndex == 1) {

                            navigateTo(context, QuizScreen(questions1));
                          }else  if (cubit.testIndex == 2) {

                            navigateTo(context, QuizScreen(OCDQestions));
                          }
                          navigateTo(context, cubit.takeTest());
                        },
                        shape: const StadiumBorder(),
                        fillColor: const Color(0xff0f1954),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 24.0),
                          child: Text(
                            "ابدأ الأختبار",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
