import 'package:etma2n/home.dart';
import 'package:etma2n/shared/component/components.dart';
import 'package:flutter/material.dart';
import '../../shared/styles/colors.dart';
import '../../widgets/components.dart';

class AboutUs extends StatefulWidget {

  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        //backgroundColor: KSeconedarycolor,
        body: ListView(
          children: <Widget>[

            customImageField(
              height: MediaQuery.of(context).size.height * .33,
              image: const AssetImage('assets/images/etmaan.png'),
            ),
            //SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                clipBehavior: Clip.antiAlias,
                shadowColor: KSeconedarycolor,
                elevation: 3.5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [KSeconedarycolor, Colors.black12],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    height: 350,
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Column(
                       // crossAxisAlignment: CrossAxisAlignment.center,
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                          'اطمئن طريقك للاستقرار النفسي دائما',
                            // maxLines: 5,
                            // overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(

                            'فريق اطمئن سعيد بانضمامك ونتمني لك أفضل حال دائما 💙',

                            // maxLines: 5,
                            // overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(

                            'تقدر تتواصل معانا عن طريق الايميل دا :'
                            ,
                            // maxLines: 5,
                            // overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "etma2n@gmail.com",
                            // maxLines: 5,
                            // overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }
}
