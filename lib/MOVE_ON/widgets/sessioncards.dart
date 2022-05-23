import 'package:flutter/material.dart';

import 'widgets.dart';


class SessionCard extends StatelessWidget {
  static String id = 'SessionCard';

  final bool isPlay = false;
  final bool isFav = false;
  static Color? color1;
  final Function() onClick;
  final bool isColor = false;
  final String sessionTitle;

   SessionCard({required this.onClick, required this.sessionTitle});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        myLine(color1 = Colors.white54),
        SizedBox(height: 12,),

        Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 15, left: 20, bottom: 5, top: 5),
            child: Row(
              children: [
                // fav icon
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
                SizedBox(width: 5,),
                // title of session
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sessionTitle,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                // play icon
                IconButton(
                  icon: Icon(
                    isPlay != true
                        ? Icons.play_circle_outline_rounded
                        : Icons.pause_circle_outline_rounded,
                  ),
                  color: Colors.white,
                  iconSize: 35,
                  onPressed: onClick(),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 12,),
      ],
    );

  }
}