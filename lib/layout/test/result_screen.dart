import 'package:etma2n/home.dart';
import 'package:etma2n/layout/test/cubit/cubit.dart';
import 'package:etma2n/layout/test/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color mainColor = const Color(0xffa9c1f7);
    return BlocConsumer<TestCubit, TestStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = TestCubit.get(context);
        String? message = cubit.messageText;
        String? resultText = cubit.resultText;
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: mainColor,
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //design
                  const Expanded(
                    child: Center(
                      child: Text(
                        "نتيجة الأختبار",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    //يعرض الشدة
                    child: Center(
                      child: Text(
                        resultText!,
                        style: const TextStyle(
                          color: Color(0xff0f1954),
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Expanded(
                    //بيعرض رسالة على اساس النتيجة
                    child: Text(
                      message!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  //الزرار اللى بيرجعنى للهوم
                  Expanded(
                    child: Center(
                      child: RawMaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  HomeScreen() ));
                        },
                        shape: const StadiumBorder(),
                        fillColor: const Color(0xff0f1954),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 30.0),
                          child: Text(
                            "الرجوع للصفحة الرئيسية",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
