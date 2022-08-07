import 'package:conditional_builder/conditional_builder.dart';
import 'package:etma2n/data/consultation.dart';
import 'package:etma2n/layout/consultation/add_new_cons.dart';
import 'package:etma2n/shared/component/components.dart';
import 'package:flutter/material.dart';

class ConsHome extends StatelessWidget {
  const ConsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'استشارات نفسية طبيه',
          ),
          actions: [
            IconButton(
                onPressed: () {
                  navigateTo(context, AddNewCons());
                },
                icon: const Icon(
                  Icons.add,
                )),
          ],
        ),
        body: ConditionalBuilder(
          condition: consultation.isNotEmpty,
          builder: (context) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildConsUlItem(
              // هنا يعرض السؤال ولاجابة
              context,
              conA: consultation[index].conslA,
              consQ: consultation[index].conslQ,
              ImageLink: consultation[index].ImageLink,
              DoctorName: consultation[index].DoctorName,
            ),
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