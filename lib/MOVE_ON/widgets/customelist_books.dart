import 'package:flutter/material.dart';

class CustomListOfBooks extends StatelessWidget {
  final Function() onClick;
  final ImageProvider image1;
  final String title;
  final String description;
  final String writer;

  CustomListOfBooks({
    required this.onClick,
    required this.image1,
    required this.title,
    required this.description,
    required this.writer,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        child: Row(
          children: [
            GestureDetector(
              onTap: onClick,
              child: Image(
                image: image1,
                height: 100,
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 6.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // description
                      Expanded(
                        child: Text(
                          description,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),

                      // writer
                      Padding(
                        padding: const EdgeInsets.only(right: 15, top: 35),
                        child: Text(
                          writer,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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
