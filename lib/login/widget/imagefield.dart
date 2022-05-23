import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomImageField extends StatelessWidget {
  final ImageProvider image;

  CustomImageField({required this.image});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30),
      child: Container(
        padding: EdgeInsets.only(top: 40),
        height: MediaQuery.of(context).size.height * .3,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image( image:image,),
/*            Positioned(
              bottom: -2,
              left: 160,
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: 'Daindra-demo',
                  fontSize: 22.0,
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}