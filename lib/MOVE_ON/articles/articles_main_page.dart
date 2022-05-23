import 'package:etma2n/MOVE_ON/articles/article_page.dart';
import 'package:etma2n/MOVE_ON/models/article_models.dart';
import 'package:etma2n/MOVE_ON/widgets/article_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ArticlesMainPage extends StatefulWidget {
  static String id = 'ArticlesMainPage';

  @override
  _ArticlesMainPageState createState() => _ArticlesMainPageState();
}

class _ArticlesMainPageState extends State<ArticlesMainPage> {

  @override
  Widget build(BuildContext context) {

    var  isColor = false;
    var  isFav = false;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          //backgroundColor: Color(0xFF5271ff),
          title: Center(
            child: Text(
              'مقالات',
              style: TextStyle(
              //  color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(
                Icons.menu,
              ),
              onPressed: () {
                onPrint();
              },
              //color: Colors.white,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              ArticleCard(
                owner: article[0].writername,
                hour: article[0].arttime,
                thearticle:article[0].artcontant,
                image1: AssetImage(article[0].writerimage),
                onClick: () {
                  int index=0;
                  Navigator.push(context,MaterialPageRoute(builder: (context) => ArticlePage(artindex: index,)),);},
                onTop: (){
                  setState(() {isColor =! isColor;
                    isFav =! isFav;});},
              ),

              ArticleCard(
                owner: article[1].writername,
                hour: article[1].arttime,
                thearticle:article[1].artcontant,
                image1: AssetImage(article[1].writerimage),
                onClick: () {
                  int index=1;
                  Navigator.push(context,MaterialPageRoute(builder: (context) => ArticlePage(artindex: index,)),);},
                onTop: (){
                  setState(() {isColor =! isColor;
                  isFav =! isFav;});},
              ),

              ArticleCard(
                owner: article[2].writername,
                hour: article[2].arttime,
                thearticle:article[2].artcontant,
                image1: AssetImage(article[2].writerimage),
                onClick: () {
                  int index=2;
                  Navigator.push(context,MaterialPageRoute(builder: (context) => ArticlePage(artindex: index,)),);},
                onTop: (){
                  setState(() {isColor =! isColor;
                  isFav =! isFav;});},
              ),

              ArticleCard(
                owner: article[3].writername,
                hour: article[3].arttime,
                thearticle:article[3].artcontant,
                image1: AssetImage(article[3].writerimage),
                onClick: () {
                  int index=3;
                  Navigator.push(context,MaterialPageRoute(builder: (context) => ArticlePage(artindex: index,)),);},
                onTop: (){
                  setState(() {isColor =! isColor;
                  isFav =! isFav;});},
              ),

              ArticleCard(
                owner: article[4].writername,
                hour: article[4].arttime,
                thearticle:article[4].artcontant,
                image1: AssetImage(article[4].writerimage),
                onClick: () {
                  int index=4;
                  Navigator.push(context,MaterialPageRoute(builder: (context) => ArticlePage(artindex: index,)),);},
                onTop: (){
                  setState(() {isColor =! isColor;
                  isFav =! isFav;});},
              ),

              ArticleCard(
                owner: article[5].writername,
                hour: article[5].arttime,
                thearticle:article[5].artcontant,
                image1: AssetImage(article[5].writerimage),
                onClick: () {
                  int index=5;
                  Navigator.push(context,MaterialPageRoute(builder: (context) => ArticlePage(artindex: index,)),);},
                onTop: (){
                  setState(() {isColor =! isColor;
                  isFav =! isFav;});},
              ),

              ArticleCard(
                owner: article[0].writername,
                hour: article[0].arttime,
                thearticle:article[0].artcontant,
                image1: AssetImage(article[0].writerimage),
                onClick: () {
                  int index=0;
                  Navigator.push(context,MaterialPageRoute(builder: (context) => ArticlePage(artindex: index,)),);},
                onTop: (){
                  setState(() {isColor =! isColor;
                  isFav =! isFav;});},
              ),

              ArticleCard(
                owner: article[1].writername,
                hour: article[1].arttime,
                thearticle:article[1].artcontant,
                image1: AssetImage(article[1].writerimage),
                onClick: () {
                  int index=1;
                  Navigator.push(context,MaterialPageRoute(builder: (context) => ArticlePage(artindex: index,)),);},
                onTop: (){
                  setState(() {isColor =! isColor;
                  isFav =! isFav;});},
              ),

              ArticleCard(
                owner: article[2].writername,
                hour: article[2].arttime,
                thearticle:article[2].artcontant,
                image1: AssetImage(article[2].writerimage),
                onClick: () {
                  int index=2;
                  Navigator.push(context,MaterialPageRoute(builder: (context) => ArticlePage(artindex: index,)),);},
                onTop: (){
                  setState(() {isColor =! isColor;
                  isFav =! isFav;});},
              ),

              ArticleCard(
                owner: article[3].writername,
                hour: article[3].arttime,
                thearticle:article[3].artcontant,
                image1: AssetImage(article[3].writerimage),
                onClick: () {
                  int index=3;
                  Navigator.push(context,MaterialPageRoute(builder: (context) => ArticlePage(artindex: index,)),);},
                onTop: (){
                  setState(() {isColor =! isColor;
                  isFav =! isFav;});},
              ),

              ArticleCard(
                owner: article[4].writername,
                hour: article[4].arttime,
                thearticle:article[4].artcontant,
                image1: AssetImage(article[4].writerimage),
                onClick: () {
                  int index=4;
                  Navigator.push(context,MaterialPageRoute(builder: (context) => ArticlePage(artindex: index,)),);},
                onTop: (){
                  setState(() {isColor =! isColor;
                  isFav =! isFav;});},
              ),

              ArticleCard(
                owner: article[5].writername,
                hour: article[5].arttime,
                thearticle:article[5].artcontant,
                image1: AssetImage(article[5].writerimage),
                onClick: () {
                  int index=5;
                  Navigator.push(context,MaterialPageRoute(builder: (context) => ArticlePage(artindex: index,)),);},
                onTop: (){
                  setState(() {isColor =! isColor;
                  isFav =! isFav;});},
              ),


            ],
          ),
        ),
      ),
    );
  }
}


onPrint() => print("printed");
