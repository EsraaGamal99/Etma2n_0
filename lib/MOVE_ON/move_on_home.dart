import 'package:etma2n/shared/component/components.dart';
import 'package:flutter/material.dart';
import '../widgets/components.dart';
import 'articles/articles_main_page.dart';
import 'books/books_main_page.dart';
import 'motivations/motivations_main_page.dart';

class MoveonHomePage extends StatelessWidget {
  static String id = 'MoveonHomePage';

  const MoveonHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  //  double height = MediaQuery.of(context).size.height;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF5271ff),
          title: const Text(
            'Move ON',
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
                print('setting opened');
              },
              color: Colors.white,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 35, right: 5, left: 5),
            child: Center(
              child: Column(
                children: [

                  moveonCard(
                    onClick: (){ navigateTo ( context,const BooksMainPage());},
                    title: 'كتب',
                    image1: const NetworkImage('https://cdn-icons-png.flaticon.com/512/29/29302.png'),
                    description :
                    "تقدر تقرأ من مكتبتك النفسية كتب"
                        " لدكاترة نفسيين ومتخصصين وتذود وعيك الثقافي بالصحة النفسية عشا"
                        "ن تساعد نفسك وإلى حواليك,صحتك النفسية تهمنا.",
                  ),

                  const SizedBox(height: 25),

                  moveonCard(
                    onClick: (){navigateTo ( context,const ArticlesMainPage());},
                    title: 'مقالات',
                    image1: const NetworkImage('https://cdn4.iconfinder.com/data/icons/seo-outline-422/50/content-form-application-article-paper-512.png'),
                    description : 'اطلع على كل ما هو جديد مع نُخبة من افضل '
                        'مقالات اطبائنا النفسيين فى التعامل مع مشكلاتك '
                        'النفسية ومعرفة إدارة ضغوطاتك بشكل يسير.',
                  ),

                  const SizedBox(height:25),

                  moveonCard(
                    onClick: (){navigateTo ( context,const MotivationsMainPage());},
                    title: 'جلسات استرخاء',
                    image1: const NetworkImage(
                      'https://cdn-icons-png.flaticon.com/512/2689/2689027.png'
                    ),   description : 'يمكنك مع مكتبتك الصوتية التعامل مع ضغوطاتك اليومية بجلسات تأمل يومية مليئة بالنصائح والانشطة لمساعدتك لاستعادة نشاطك وحماسك.',
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