import 'package:etma2n/shared/component/components.dart';
import 'package:flutter/material.dart';

import '../../models/motivation_models.dart';
import '../../widgets/components.dart';
import 'motivations_page.dart';

class MotivationsMainPage extends StatelessWidget {
  static String id = 'MotivationsMainPage';

  const MotivationsMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF5271ff),
          title: const Text(
            'جلسات استرخاء',
            style: TextStyle(
              color: Colors.white,
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
                onPrint();
              },
              color: Colors.white,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => motivationCard(
                    onClick: () {
                      Color bkcolor = motivation[index].motbackcolor;
                      navigateTo ( context,MotivationPage(motindex: index, backcolor: bkcolor,));
                    },
                    title: motivation[index].motname,
                    image1: AssetImage(motivation[index].motbackimage),
                    description: motivation[index].motsession,
                    color1: motivation[index].motbackcolor,
                    color2: Colors.black12,
                  ),
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 20,
                  ),
                  itemCount: motivation.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

onPrint() => print("printed");
