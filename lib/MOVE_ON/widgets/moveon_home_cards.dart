import 'package:flutter/material.dart';

class CustomCards extends StatelessWidget {
  final Function() onClick;
  final String title;
  final String description;
  final ImageProvider image1;
  final Icon? icon;

  CustomCards(
      {required this.onClick,required this.title,required this.description, this.icon,required this.image1});

  @override
  Widget build(BuildContext context) {
    double height1 = MediaQuery.of(context).size.height;
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
        child: Container(
          height: height1 * 0.28,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF5271ff), Colors.black12],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [
              GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Image(
                    image: image1,
                    height: 66,
                    width: 66,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 23.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13.5,
                        fontWeight: FontWeight.w700,
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

onPrint() => print("printed");

/*
//basic card for text , color , rounded card
buildBasicCard() => Card(
      clipBehavior: Clip.antiAlias,
      shadowColor: Colors.amberAccent,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.indigoAccent, Colors.black87],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mariam Gaber',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '21 years old',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
            Text(
              'Mariam Gaber',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            Text(
              '21 years old',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
            Text(
              'Mariam Gaber',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            Text(
              '21 years old',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
          ],
        ),
      ),
    );

//basic card with image
buildimageCard() => Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),

      child: Stack(
        alignment: Alignment.center,
        children: [
          Ink.image(
            image: NetworkImage('https://unsplash.com/photos/96vZSIQQpfk'),
            colorFilter: ColorFilters.greyscal,
            child: InkWell(
              onTap: () {},
            ),
            height: 250,
            fit: BoxFit.cover,
          ),
          Text(
            'Card with splash',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ],
      ),
    );
*/
