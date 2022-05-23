import 'package:etma2n/MOVE_ON/models/article_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticlePage extends StatefulWidget {
  static String id = 'ArticlePage';
  final int artindex;

  ArticlePage({ required this.artindex});

  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    double height1 = MediaQuery.of(context).size.height;
    var isColor = false;
    var isFav = false;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
        body: Column(
          children: [
            Container(
              height: height1,
              clipBehavior: Clip.antiAlias,
              padding: EdgeInsets.only(right: 20, left: 20, top: 77),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.5),
                gradient: LinearGradient(
                  colors: [
                    Color(0XFFD6D6D6),
                    Color(0xFF5271ff),
                    Color(0XFFE0E0E0)
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
                            backgroundImage: AssetImage(
                                article[widget.artindex].writerimage),
                          ),
                          SizedBox(
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
                        iconSize: 33,
                        color: isColor == false ? Colors.white70 : Colors.red,
                        icon: Icon(
                          isFav == false
                              ? Icons.favorite_border_rounded
                              : Icons.favorite,
                        ),
                        onPressed: () {
                          setState(() {
                            isColor = !isColor;
                            isFav = !isFav;
                          });
                        },
                      ),
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
                        SizedBox(
                          height: 15,
                        ),

                        //article
                        Text(
                          article[widget.artindex].artcontant,
                          style: TextStyle(
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
    );
  }
}
