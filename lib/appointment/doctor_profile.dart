import 'package:etma2n/shared/component/components.dart';
import 'package:flutter/material.dart';
import '../models/doctors_model.dart';
import '../widgets/components.dart';
import 'about_session.dart';

class DoctorProfile extends StatelessWidget {
  final int docindex;
  final double coverHeight = 200;
  final double profileHeight = 100;

  const DoctorProfile({Key? key, required this.docindex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final top1 = coverHeight - profileHeight / 2;
    final bottom1 = profileHeight / 2;
    List<IconData> rateicons = doctor[docindex].rateicon;
    List<Color> ratcolor = doctor[docindex].ratecolor;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    Container(
                      color: Colors.grey[500],
                      child: Image.network(
                        'https://www.teahub.io/photos/full/1-13343_cartoon-wallpaper-blue-cartoon.jpg',
                        width: double.infinity,
                        height: coverHeight,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: top1,
                      child: CircleAvatar(
                        radius: profileHeight / 2,
                        backgroundColor: Colors.grey.shade700,
                        backgroundImage:
                            NetworkImage(doctor[docindex].docpic),
                      ),
                    ),
                  ]),
              const SizedBox(
                height: 5,
              ),
              //about
              Column(
                children: [
                  //name
                  Container(
                    padding: EdgeInsets.only(top: bottom1),
                    child: Center(
                      child: Text(
                        doctor[docindex].docname,
                        style: const TextStyle(
                            fontSize: 25,
                            color: Colors.indigoAccent,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  //rate
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 240, top: 11, left: 5),
                        child: Row(
                          children: [
                            Icon(
                              rateicons[0],
                              color: ratcolor[0],
                            ),
                            Icon(
                              rateicons[1],
                              color: ratcolor[1],
                            ),
                            Icon(
                              rateicons[2],
                              color: ratcolor[2],
                            ),
                            Icon(
                              rateicons[3],
                              color: ratcolor[3],
                            ),
                            Icon(
                              rateicons[4],
                              color: ratcolor[4],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  //about
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 11, left: 11, bottom: 10, top: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            '${doctor[docindex].docabout} ${doctor[docindex].docabout} ${doctor[docindex].docabout} ${doctor[docindex].docabout} ${doctor[docindex].docabout}',
                            style: TextStyle(
                              backgroundColor: Colors.grey[200],
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                            maxLines: 5,
                            // overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  myLine(Colors.grey[200]!),
                  const SizedBox(
                    height: 15,
                  ),

                  //مهارات
                  buildAbout(
                    icon1: doctor[docindex].icnyears,
                    about: doctor[docindex].docyears,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  buildAbout(
                    icon1: doctor[docindex].icnconnects,
                    about: doctor[docindex].docconects,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  buildAbout(
                    icon1: doctor[docindex].icnlangs,
                    about: doctor[docindex].doclangs,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  myLine(Colors.grey[200]!),
                  const SizedBox(
                    height: 15,
                  ),

                  //تخصصات
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //title
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Center(
                            child: Text(
                              'التخصصات الدقيقة',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),

                      //list of

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment:
                                  CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Container(
                                      width: 150,
                                      height: 50,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius:
                                            BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text(
                                          doctor[docindex]
                                              .docspecialties1[index],
                                          style: const TextStyle(
                                            color: Colors.indigoAccent,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  itemCount: doctor[docindex]
                                      .docspecialties1
                                      .length,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    width: 5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            //fit: FlexFit.loose,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment:
                                  CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder: (BuildContext context, int index) => Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Container(
                                      width: 150,
                                      height: 50,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius:
                                            BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text(
                                          doctor[docindex]
                                              .docspecialties2[index],
                                          style: const TextStyle(
                                            color: Colors.indigoAccent,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  itemCount: doctor[docindex]
                                      .docspecialties2
                                      .length,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    width: 5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 5,
                  ),
                  myLine(Colors.grey[200]!),
                  const SizedBox(
                    height: 10,
                  ),

                  //تقيمات
                  Column(
                    children: [
                      //title
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              'التقيمات :  ''${doctor[docindex].fusername.length}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                      //feedback
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => buildRate(
                          username: doctor[docindex].fusername[index],
                          date: doctor[docindex].fbdate[index],
                          comment: doctor[docindex].fbcomment[index],
                        ),
                        separatorBuilder: (context, index) => const SizedBox(height: 5,),
                        itemCount: doctor[docindex].fusername.length,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(right: 15, left: 8, bottom: 5, top: 5),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              FlatButton(
                onPressed: () {
                  navigateTo ( context, AboutSession(docindex: docindex));
                },
                color: Colors.indigoAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: const [
                    Text(
                      'احجز الأن',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 18.5,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.download_done_outlined,
                      color: Colors.white,
                      // size: 15,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 99,
              ),
              const Expanded(
                child: Text(
                  '250 ج.م / 30 دقيقة',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: Colors.indigoAccent),
                  // maxLines: 2,
                  // overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAbout({IconData? icon1, String? about}) => Padding(
        padding: const EdgeInsets.only(
          right: 22,
        ),
        child: Row(
          children: [
            Icon(
              icon1,
              color: Colors.black87,
              size: 33,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              about!,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      );

  Widget buildSpecialties({String? specialty1, String? specialty2}) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: 150,
              height: 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  specialty1!,
                  style: const TextStyle(
                    color: Colors.indigoAccent,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: 150,
              height: 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  specialty2!,
                  style: const TextStyle(
                    color: Colors.indigoAccent,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      );

  /*  //cover
  Widget buildCoverImage() => Container(
        color: Colors.grey[500],
        child: Image.network(
          'https://www.teahub.io/photos/full/1-13343_cartoon-wallpaper-blue-cartoon.jpg',
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );
  //profile
  Widget buildProfileImage() => CircleAvatar(
    radius: profileHeight/2,
    backgroundColor: Colors.grey.shade700,
    backgroundImage: NetworkImage(doctor[docindex].docpic),
  );
*/

  Widget buildRate({String? comment, String? date, String? username}) => Padding(
        padding: const EdgeInsets.only(
          right: 8,
          left: 8,
          bottom: 8,
        ),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shadowColor: const Color(0xFF5271f0),
          elevation: 3.5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            // height: 100,
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(
                      Icons.face,
                      color: Colors.indigoAccent,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Text(
                        comment!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                myLine(Colors.grey[200]!),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      username!,
                      style: const TextStyle(
                        color: Colors.indigoAccent,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      width: 177,
                    ),
                    Text(
                      date!,
                      style: const TextStyle(
                        color: Colors.indigoAccent,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
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
