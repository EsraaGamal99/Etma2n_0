import 'package:etma2n/layout/test/cubit/cubit.dart';
import 'package:etma2n/layout/test/cubit/states.dart';
import 'package:etma2n/model/question_model.dart';
import 'package:etma2n/shared/component/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'result_screen.dart';

class QuizScreen extends StatelessWidget {
  final List<QuestionModel> test;

  QuizScreen(this.test);

  Color mainColor = const Color(0xffa9c1f7);
  Color secondColor = const Color(0xff576dca);
  bool isPress = false;
  final PageController? _controller = PageController();

  @override
  Widget build(BuildContext context) {
    var cubit = TestCubit.get(context);
    return BlocConsumer<TestCubit, TestStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: mainColor,
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: PageView.builder(
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (page) {
                  TestCubit.get(context).isPress;
                },
                itemCount: test.length,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              "السؤال ${index + 1}/ ${test.length}",
                              style: const TextStyle(
                                color: Color(0xff0f1954),
                                fontSize: 25.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          const Divider(
                            color: Colors.white,
                            height: 8.0,
                            thickness: 1.0,
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          //بيعرض السؤال اللى فى الملف
                          Text(
                            test[index].question!,
                            style: const TextStyle(
                              fontSize: 22.0,
                              color: Colors.white,
                              //fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          //بيعرض الاجابات اللى موجودة فى الملف
                          for (int i = 0; i < test[index].answer!.length; i++)
                            Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(bottom: 15.0),
                              child: MaterialButton(
                                shape: const StadiumBorder(),
                                color: secondColor,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15.0),
                                //هنا بعد ما يجاوب بيشوف انا واقفة فين لو لسه فيه اسئلة بيكمل ولو وصلت لاخر سؤال بيعرض النتيجة
                                onPressed: () {
                                  cubit.resultScore = cubit.resultScore +
                                      test[index].answer!.values.elementAt(i);
                                  print(cubit.resultScore);
                                  if (index + 1 == test.length) {
                                    cubit.totalResult = test.length * 4;
                                    cubit.changePage();
                                    navigateTo(
                                      context,
                                      ResultScreen(),
                                    );
                                  } else {
                                    _controller!.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.linear);
                                  }
                                },
                                //الاجابات نفسها
                                child: Text(
                                  test[index].answer!.keys.toList()[i],
                                  style: const TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        );
      },
    );
  }
}
