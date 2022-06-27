import 'package:flutter/material.dart';

class ConsView extends StatelessWidget {
  final String conQ;
  final String conA;
  final String DoctorName;
  final String ImageLink ;
  ConsView(this.conQ, this.conA,this.ImageLink, this.DoctorName);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'استشارات نفسية طبيه',

          ),
        ),
        body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //question
                  Text(
                    conQ,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),
                    //maxLines: 2,
                    //overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  //answer
                  Text(
                    conA,
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 15.0,
                    ),
                    //maxLines: 2,
                    // overflow: TextOverflow.ellipsis,
                  ),
                  //doctor

                ],
              ),
            ),
            Row(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    CircleAvatar(
                      radius: 19.0,
                      backgroundImage: NetworkImage(
                          ImageLink),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Text(
                  DoctorName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        ),
      ),
    );
  }
}
