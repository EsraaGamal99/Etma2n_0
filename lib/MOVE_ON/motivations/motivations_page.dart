import 'package:flutter/material.dart';

import '../../models/motivation_models.dart';
import '../../widgets/sessioncards.dart';

class MotivationPage extends StatefulWidget {
  final int motindex;
  final Color? backcolor;
  static Color? color1;

  const MotivationPage({Key? key, required this.motindex, this.backcolor})
      : super(key: key);

  @override
  _MotivationPageState createState() => _MotivationPageState();
}

class _MotivationPageState extends State<MotivationPage> {
  @override
  Widget build(BuildContext context) {
//    var index = widget.motindex;
//   var sessioncounter = motivation[index].motnum_sessions;

    double height1 = MediaQuery.of(context).size.height;
    double width1 = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // background color
        backgroundColor: widget.backcolor,
        body: Container(
          padding: const EdgeInsets.only(top: 0),
          child: Stack(
            children: [
              Image(
                image: AssetImage(motivation[widget.motindex].motbackimage),
                height: 320,
                width: width1,
                fit: BoxFit.cover,
                color: widget.backcolor!.withOpacity(1),
                colorBlendMode: BlendMode.softLight,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: <Widget>[
                      Container(
                        height: 300,
                        width: width1,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [widget.backcolor!, Colors.black12],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            tileMode: TileMode.mirror,
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.bottomRight,
                          padding: const EdgeInsets.only(top: 200, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                motivation[widget.motindex].motname,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                motivation[widget.motindex].motdiscripation,
                                maxLines: 2,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // sessions
                      Container(
                        height: height1 - 300,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [widget.backcolor!, Colors.white24],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomLeft,
                            tileMode: TileMode.mirror,
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) => SessionCard(
                                  sessionTitle: session[index].sestitle,
                                  sespath: session[index].sespath,
                                ),
                                separatorBuilder: (context, index) => const SizedBox(
                                  height: 1,
                                ),
                                itemCount: session.length,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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

onPrint() => print("printed");

/*
        appBar: AppBar(
          backgroundColor: Color(0xFF5271ff),
          title: Text(
            motivation[motindex].motname,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(
                Icons.menu,
              ),
              onPressed: () {onPrint();},
              color: Colors.white,
            ),
          ],
        ),

 */
