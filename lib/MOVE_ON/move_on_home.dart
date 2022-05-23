import 'package:etma2n/MOVE_ON/articles/articles_main_page.dart';
import 'package:etma2n/MOVE_ON/books/books_main_page.dart';
import 'package:etma2n/MOVE_ON/motivations/motivations_main_page.dart';
import 'package:flutter/material.dart';

import 'widgets/moveon_home_cards.dart';

class MoveonHomePage extends StatelessWidget {
  static String id = 'MoveonHomePage';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          //backgroundColor: Color(0xFF5271ff),
          /*leading: const IconButton(
            onPressed: onPrint,
            //onPressed: () {Navigator.pop(context);},
            icon: Icon(
              Icons.arrow_back,
              //color: Colors.white,
            ),
          ),*/
          title: const Text(
            'Move ON',
            style: TextStyle(
              //color: Colors.white,
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
            //  color: Colors.white,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 5,
            right: 5,
            left: 5,
          ),
          child: Center(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  CustomCards(
                    onClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BooksMainPage()),
                      );
                    },
                    title: 'كتب',
                    image1: AssetImage('assets/images/books2.png'),
                    description: "تقدر تقرأ من مكتبتك النفسية كتب"
                        " لدكاترة نفسيين ومتخصصين وتذود وعيك الثقافي بالصحة النفسية عشا"
                        "ن تساعد نفسك وإلى حواليك,صحتك النفسية تهمنا.",
                  ),
                  SizedBox(height: height * .025),
                  CustomCards(
                    onClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ArticlesMainPage()),
                      );
                    },
                    title: 'مقالات',
                    image1: AssetImage('assets/images/articles0.png'),
                    description: 'اطلع على كل ما هو جديد مع نُخبة من افضل '
                        'مقالات اطبائنا النفسيين فى التعامل مع مشكلاتك '
                        'النفسية ومعرفة إدارة ضغوطاتك بشكل يسير.',
                  ),
                  SizedBox(height: height * .025),
                  CustomCards(
                    onClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MotivationsMainPage()),
                      );
                    },
                    title: 'جلسات استرخاء',
                    image1: AssetImage('assets/images/motivation.png'),
                    description:
                        'يمكنك مع مكتبتك الصوتية التعامل مع ضغوطاتك اليومية بجلسات تأمل يومية مليئة بالنصائح والانشطة لمساعدتك لاستعادة نشاطك وحماسك.',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

onPrint() => print("printed");
