import 'package:etma2n/Settings/main_setting_page.dart';
import 'package:etma2n/add_article.dart';
import 'package:etma2n/models/doctors_model.dart';
import 'package:etma2n/shared/component/components.dart';
import 'package:flutter/material.dart';

import '../../models/article_models.dart';
import '../../widgets/components.dart';
import 'article_page.dart';

class ArticlesDoctor extends StatefulWidget {
  final List<String>? articles;
  final List<String>? docnames;
  final List<String>? title;
  final List<String>? time;

  const ArticlesDoctor({Key? key, this.articles, this.docnames, this.title, this.time, }) : super(key: key);

  @override
  _ArticlesDoctorState createState() => _ArticlesDoctorState();
}
bool isColor=false;
bool isFav = false;
class _ArticlesDoctorState extends State<ArticlesDoctor> {
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
                Icons.add,
              ),
              onPressed: () {
                navigateTo(context,  AddArticle());
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.settings,
              ),
              onPressed: () {
                navigateTo(context, const SettingScreen());
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
                    setState(() {
                      isColor =! isColor;
                      isFav =! isFav;
                    });
                    navigateTo ( context,ArticlePage(artindex: index,));},
                ),
                separatorBuilder: (context, index) => const SizedBox(height: 1,),
                itemCount: article.length,
              ),

              if(widget.articles != null)
              ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => articleCard(
                  owner: widget.docnames![index],
                  hour:  widget.time![index],
                  thearticle:  widget.articles![index],
                  image1: NetworkImage(doctor[index].docpic),
                  onClick: () {
                    setState(() {
                      isColor =! isColor;
                      isFav =! isFav;
                    });
                    navigateTo ( context,ArticlePage(artindex: index,));},
                ),
                separatorBuilder: (context, index) => const SizedBox(height: 1,),
                itemCount: widget.articles!.length,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
