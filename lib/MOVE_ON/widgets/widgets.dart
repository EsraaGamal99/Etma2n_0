import 'package:flutter/material.dart';

Widget myLine(Color color1) => Padding(
        padding: const EdgeInsetsDirectional.only(
          start: 20.0,
          end: 20.0,
        ),
        child: Container(
          width: double.infinity,
          height: 2,
          color:color1,
        ),
      );


Widget mySession({
  bool isPlay = false,
  bool isFav = false,
  Color? color1,
  double? height1,
  required Function() onClick,
  bool isColor = false,
  required String sessionTitle,}) =>
    Padding(
      padding: const EdgeInsets.only(right: 15, left: 20, bottom: 5, top: 5),
      child: Center(
        child: Row(
          children: [
            IconButton(
              iconSize: 30,
              color: isColor != true ? Colors.white : Colors.red,
              icon: Icon(
                isFav != true
                    ? Icons.favorite_border_rounded
                    : Icons.favorite,
              ),
              onPressed: onClick(),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sessionTitle,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                isPlay != true
                    ? Icons.play_circle_outline_rounded
                    : Icons.pause_circle_outline_rounded,
              ),
              color: Colors.white,
              iconSize: 35,
              onPressed: onClick(
                //isPlay,
              ),
            ),
          ],
        ),
      ),
    );
