import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/article_models.dart';

class ArticlePage extends StatefulWidget {
  static String id = 'ArticlePage';
  final int artindex;

  const ArticlePage({Key? key, required this.artindex}) : super(key: key);

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

bool  isColor = false;
bool  isFav = false;

class _ArticlePageState extends State<ArticlePage> {

  String txtfile='';
  getData () async {
    String response;
    response = await rootBundle.loadString('article_txt/art1.txt');
    setState(() {
      txtfile=response;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height1 = MediaQuery.of(context).size.height;
    //double width1 = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
               // height: height1,
                clipBehavior: Clip.antiAlias,
                padding: const EdgeInsets.only(right: 20, left: 20, top: 77),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.5),
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey[350]!,
                      const Color(0xFF5271ff),
                      Colors.grey[300]!
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // writer
                    Row(
                      children: [
                        Expanded(
                          child: Row(children: [
                            CircleAvatar(
                              radius: 30.0,
                              backgroundImage: NetworkImage(
                                  article[widget.artindex].writerimage),
                            ),
                            const SizedBox(
                              width: 12.5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // owner name
                                Text(
                                  article[widget.artindex].writername,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                // time
                                Text(
                                  article[widget.artindex].arttime,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ]),
                        ),
                        IconButton(
                            iconSize: 30,
                            color: isColor != true ? Colors.white : Colors.red,
                            icon: Icon(
                              isFav != true
                                  ? Icons.favorite_border_rounded
                                  : Icons.favorite,
                            ),
                            onPressed: () {
                              setState(() {
                                isFav = !isFav;
                                isColor = !isColor;
                              });
                            }),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //title
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            article[widget.artindex].arttitle,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22.5,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 15,
                          ),

                          //article
                          Text(
                            article[widget.artindex].artcontant,
                            style: const TextStyle(
                              fontSize: 18.5,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          leading: IconButton(
            onPressed: () {Navigator.pop(context);},
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xff5271ff),
            ),
          ),
          title: Center(
            child: Text(
              article[widget.artindex].arttitle,
              style: TextStyle(
                color: Color(0xFF5271ff),
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.menu,),
              onPressed: () {print("pressed !!!!!");},
              color: Color(0xFF5271ff),),
          ],
        ),*/
