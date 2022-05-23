import 'package:etma2n/MOVE_ON/models/motivation_models.dart';
import 'package:etma2n/MOVE_ON/motivations/motivations_page.dart';
import 'package:etma2n/MOVE_ON/widgets/customcard_motvations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MotivationsMainPage extends StatelessWidget {
  static String id = 'MotivationsMainPage';

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
                const SizedBox(height: 20),
                CustomMotvationCards(
                  onClick: () {
                    int index = 0;
                    Color bkcolor = motivation[0].motbackcolor;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MotivationPage(
                              motindex: index, backcolor: bkcolor)),
                    );
                  },
                  title: motivation[0].motname,
                  description: motivation[0].motsession,
                  color1: const Color(0XFF8D6E63),
                  color2: Colors.black12,
                  image1: AssetImage(motivation[0].motbackimage),
                ),
                const SizedBox(height: 20),
                CustomMotvationCards(
                  onClick: () {
                    int index = 1;
                    Color bkcolor = motivation[1].motbackcolor;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MotivationPage(
                              motindex: index, backcolor: bkcolor)),
                    );
                  },
                  title: motivation[1].motname,
                  image1: AssetImage(motivation[1].motbackimage),
                  description: motivation[1].motsession,
                  color1: motivation[1].motbackcolor,
                  color2: Colors.black12,
                ),
                const SizedBox(height: 20),
                CustomMotvationCards(
                  onClick: () {
                    int index = 2;
                    Color bkcolor = motivation[2].motbackcolor;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MotivationPage(
                              motindex: index, backcolor: bkcolor)),
                    );
                  },
                  title: motivation[2].motname,
                  image1: AssetImage(motivation[2].motbackimage),
                  description: motivation[2].motsession,
                  color1: motivation[2].motbackcolor,
                  color2: Colors.black12,
                ),
                const SizedBox(height: 20),
                CustomMotvationCards(
                  onClick: () {
                    int index = 3;
                    Color bkcolor = motivation[3].motbackcolor;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MotivationPage(
                              motindex: index, backcolor: bkcolor)),
                    );
                  },
                  title: motivation[3].motname,
                  image1: AssetImage(motivation[3].motbackimage),
                  description: motivation[3].motsession,
                  color1: motivation[3].motbackcolor,
                  color2: Colors.black12,
                ),
                const SizedBox(height: 20),
                CustomMotvationCards(
                  onClick: () {
                    int index = 4;
                    Color bkcolor = motivation[4].motbackcolor;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MotivationPage(
                              motindex: index, backcolor: bkcolor)),
                    );
                  },
                  title: motivation[4].motname,
                  image1: AssetImage(motivation[4].motbackimage),
                  description: motivation[4].motsession,
                  color1: motivation[4].motbackcolor,
                  color2: Colors.black12,
                ),
                const SizedBox(height: 20),
                CustomMotvationCards(
                  onClick: () {
                    int index = 5;
                    Color bkcolor = motivation[5].motbackcolor;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MotivationPage(
                              motindex: index, backcolor: bkcolor)),
                    );
                  },
                  title: motivation[5].motname,
                  image1: AssetImage(motivation[5].motbackimage),
                  description: motivation[5].motsession,
                  color1: motivation[5].motbackcolor,
                  color2: Colors.black12,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

onPrint() => print("printed");
