import 'package:conditional_builder/conditional_builder.dart';
import 'package:etma2n/data/consultation.dart';
import 'package:etma2n/layout/consultation/DoctorAnswerCon.dart';
import 'package:etma2n/layout/consultation/add_new_cons.dart';
import 'package:etma2n/layout/consultation/con_cubit/cubit.dart';
import 'package:etma2n/layout/consultation/con_cubit/states.dart';
import 'package:etma2n/shared/component/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConsQuestionHome extends StatelessWidget {
  const ConsQuestionHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConsCubit, ConsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ConsCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                title: const Text(
                  'استشارات نفسية طبيه',
                ),
              ),
              body: Column(
                children: [
                  ConditionalBuilder(
                    condition: consultation.isNotEmpty,
                    builder: (context) => ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          buildConsQlItem(consultation[index].conslQ, context),
                      separatorBuilder: (context, index) => myDivider(),
                      itemCount: consultation.length,
                    ),
                    fallback: (context) => const Center(
                        child: CircularProgressIndicator(
                      color: Colors.deepPurpleAccent,
                    )),
                  ),
                  ConditionalBuilder(
                    condition: ConsCubit.get(context).ConQuest.isNotEmpty,
                    builder: (context) => ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => buildConsQlItem(
                          ConsCubit.get(context).ConQuest[index], context),
                      separatorBuilder: (context, index) => myDivider(),
                      itemCount: ConsCubit.get(context).ConQuest.length,
                    ),
                    fallback: (context) => const Center(
                        child: CircularProgressIndicator(
                      color: Colors.deepPurpleAccent,
                    )),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
