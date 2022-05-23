import 'package:flutter/material.dart';

class ArticleCard extends StatelessWidget {
  static String id = 'ArticleCard';

  final String owner;
  final String hour;
  final ImageProvider image1;
  final String? title;
  final String thearticle;
  final Function() onClick;
  final Function() onTop;

  const ArticleCard(
      {
      required this.onClick,
        required this.image1,
          this.title,
        required  this.thearticle,
        required this.owner,
        required this.hour,
        required this.onTop});

  @override
  Widget build(BuildContext context) {
    var isColor;
    var isFav;

    return GestureDetector(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shadowColor: Color(0xFF5271f0),
          elevation: 3.5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Container(
            height: 220,
            padding: EdgeInsets.all(10),
/*            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF5271ff), Colors.black12],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),*/
            child: Column(
              children: [

                // owner
                Row(
                  children: [
                    Expanded(
                      child: Row(children: [
                        CircleAvatar(
                          radius: 25.0,
                          backgroundImage: image1,
                        ),
                        SizedBox(
                          width: 12.5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // owner name
                            Text(
                              owner,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            // time
                            Text(
                              hour,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ]),
                    ),
                    IconButton(
                      iconSize: 30,
                      color: isColor == false ? Colors.black : Colors.red,
                      icon: Icon(
                        isFav == false
                            ? Icons.favorite_border_rounded
                            : Icons.favorite,
                      ),
                      onPressed: onTop,
                    ),
                  ],
                ),

                //article
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        thearticle,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 230),
                        child: TextButton(
                          onPressed: onClick,
                          child: Text(
                            'أقرا المزيد',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
