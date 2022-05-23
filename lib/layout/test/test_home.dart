import 'package:etma2n/layout/test/cubit/cubit.dart';
import 'package:etma2n/layout/test/cubit/states.dart';
import 'package:etma2n/layout/test/welcome.dart';
import 'package:etma2n/shared/component/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestHome extends StatelessWidget {
  const TestHome({Key? key}) : super(key: key);
// ده صفحة عشان يختار نوع الاختبار
  @override
  Widget build(BuildContext context) {
    var cubit = TestCubit.get(context);
    return BlocConsumer<TestCubit, TestStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text(
                "الاختبارات النفسية",
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildCart(
                      function: () {
                        cubit.testIndex = 0;
                        cubit.testName = "  مقياس الاكتئاب";
                        navigateTo(
                          context,
                          Welcom("  مقياس الاكتئاب"),
                        );
                        print(cubit.testName);
                      },
                      testName: "  مقياس الاكتئاب",
                      imageLink:
                          'https://assets.telegraphindia.com/telegraph/12b2cd31-8bb8-48cd-9229-09aa33a7821f.jpg',
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    buildCart(
                      function: () {
                        cubit.testIndex = 1;
                        cubit.testName = "  مقياس اضطراب ما بعد الصدمة";
                        navigateTo(
                          context,
                          Welcom("  مقياس اضطراب ما بعد الصدمة"),
                        );
                        print(cubit.testName);
                      },
                      testName: "  مقياس اضطراب ما بعد الصدمة",
                      imageLink:
                          'https://imageio.forbes.com/specials-images/imageserve/60123248d374d90da5101ec2/Head-shape-with-PTSD-Post-traumatic-stress-disorder-/960x0.jpg?fit=bounds&format=jpg&width=960',
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    buildCart(
                      function: () {
                        cubit.testIndex = 2;
                        cubit.testName = "  مقياس الوسواس القهري";
                        navigateTo(
                          context,
                          Welcom("  مقياس الوسواس القهري"),
                        );
                        print('hello');
                      },
                      testName: "  مقياس الوسواس القهري",
                      imageLink:
                          'https://static.webteb.net/images/content/tbl_articles_article_25664_32669ee971d-ded9-456d-95d1-921e33bbbc08.jpg',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
        ;
      },
    );
  }
}
