import 'package:conditional_builder/conditional_builder.dart';
import 'package:etma2n/data/consultation.dart';
import 'package:etma2n/layout/consultation/DoctorAnswerCon.dart';
import 'package:etma2n/layout/consultation/add_new_cons.dart';
import 'package:etma2n/shared/component/components.dart';
import 'package:flutter/material.dart';


class ConsQuestionHome extends StatelessWidget {
  const ConsQuestionHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'استشارات نفسية طبيه',
          ),
        ),
        body: ConditionalBuilder(
          condition: consultation.isNotEmpty,
          builder: (context) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildConsQlItem(
              // هنا يعرض لاجابة
                consultation[index].conslQ,
                context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: consultation.length,
          ),
          fallback: (context) => const Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurpleAccent,
              )),
        ),
      ),
    );
  }
}
