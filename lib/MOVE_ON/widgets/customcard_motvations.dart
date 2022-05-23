import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'dart:ui' as prefix0;


class CustomMotvationCards extends StatelessWidget {
  static String id = 'CustomMotvationCards';

  final Function() onClick;
  final String title;
  final String description;
  final ImageProvider image1;
 // final ImageProvider image2;
  final Color color1;
  final Color color2;

  CustomMotvationCards({
    required this.onClick,
    required this.title,
    required this.color1,
    required this.color2,
    required this.description,
    required this.image1,
   // this.image2,
  });

  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onClick,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shadowColor: Colors.black,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [

            //background image
            Ink.image(
              image: image1,
              fit: BoxFit.cover,
              height: 170,
              child: InkWell(
                onTap: onClick,
              ),
            ),

            Container(
              height: 170,
              padding: const EdgeInsets.only(right: 20,left: 20,bottom: 0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color1, color2],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),

              child: Row(
                children: [
                  // icon of motivation

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 95, 0,0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          // description of motivation
                          Container(
                            height: 25,
                            padding: EdgeInsets.only(right: 10,left: 10),
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.elliptical(10, 10),
                                ),
                              ),
                            color: Colors.white24,),
                            child: Text(
                              description,
                              style: TextStyle(
                                //backgroundColor: Colors.grey,
                                color: Colors.white,
                                //fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
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

/*
 // filter
 Positioned.fill(
                child: BackdropFilter(
                  filter: prefix0.ImageFilter.blur(sigmaX: 1.5, sigmaY:1.5),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),*/
