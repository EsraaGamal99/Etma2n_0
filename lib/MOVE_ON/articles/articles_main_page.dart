import 'package:etma2n/Settings/main_setting_page.dart';
import 'package:etma2n/shared/component/components.dart';
import 'package:flutter/material.dart';

import '../../models/article_models.dart';
import '../../widgets/components.dart';
import 'article_page.dart';

class ArticlesMainPage extends StatefulWidget {
  static String id = 'ArticlesMainPage';

  const ArticlesMainPage({Key? key}) : super(key: key);

  @override
  _ArticlesMainPageState createState() => _ArticlesMainPageState();
}
bool isColor=false;
bool isFav = false;
class _ArticlesMainPageState extends State<ArticlesMainPage> {
  @override
  Widget build(BuildContext context) {
  //  double height1 = MediaQuery.of(context).size.height;
  //  double width1 = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(

          title: const Center(
            child: Text(
              'مقالات',

            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.settings,
              ),
              onPressed: () {
                navigateTo(context, SettingScreen());
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => articleCard(
                  owner: article[index].writername,
                  hour: article[index].arttime,
                  thearticle: article[index].artcontant,
                  image1: NetworkImage(article[index].writerimage),
                  onClick: () {
                   /* setState(() {
                      isColor =! isColor;
                      isFav =! isFav;
                    });*/
                    navigateTo ( context,ArticlePage(artindex: index,));},
                ),
                separatorBuilder: (context, index) => const SizedBox(height: 1,),
                itemCount: article.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

onPrint() => print("printed");
