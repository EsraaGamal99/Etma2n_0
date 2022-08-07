import 'package:etma2n/doctor_profile.dart';
import 'package:etma2n/home.dart';
import 'package:etma2n/shared/AppCubit/cubit.dart';
import 'package:etma2n/shared/component/components.dart';
import 'package:flutter/material.dart';
import '../../shared/styles/colors.dart';
import '../../widgets/components.dart';

class RateAPP extends StatefulWidget {

  const RateAPP({Key? key}) : super(key: key);

  @override
  State<RateAPP> createState() => _RateAPPState();
}

class _RateAPPState extends State<RateAPP> {

  //bool isDote=false;
  bool isDote1=false;
  bool isDote2=false;
  bool isDote3=false;
  bool isDote4=false;
  bool isDote5=false;
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
            SizedBox(height: height * .045),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 50,
                    onPressed: (){
                    setState(() {
                      isDote1 = !isDote1;
                    });
                  },
                  color: isDote1==false? Colors.grey:Colors.yellow,
                    icon: Icon(isDote1==false?Icons.star_border:Icons.star),
                ),
                const SizedBox(width: 5,),
                IconButton(
                  iconSize: 50,
                  onPressed: (){
                    setState(() {
                      isDote2 = ! isDote2;
                      if(isDote2== false)
                        isDote1= true;
                    });

                  },
                  color: isDote2==false? Colors.grey:Colors.yellow,
                  icon: Icon(isDote2==false?Icons.star_border:Icons.star),
                ),
                const SizedBox(width: 5,),
                IconButton(
                  iconSize: 50,
                  onPressed: (){
                    setState(() {
                      isDote3 = ! isDote3;
                      if(isDote2== false)
                        isDote1= true;
                      if(isDote2== false)
                        isDote2= true;
                    });

                  },
                  color: isDote3==false? Colors.grey:Colors.yellow,
                  icon: Icon(isDote3==false?Icons.star_border:Icons.star),
                ),
                const SizedBox(width: 5,),
                IconButton(
                  iconSize: 50,
                  onPressed: (){
                    setState(() {
                      isDote4 = ! isDote4;
                      if(isDote2== false)
                        isDote1= true;
                      if(isDote2== false)
                        isDote2= true;
                      if(isDote3== false)
                        isDote3= true;
                    });
                  },
                  color: isDote3==false? Colors.grey:Colors.yellow,
                  icon: Icon(isDote3==false?Icons.star_border:Icons.star),
                ),
                const SizedBox(width: 5,),
                IconButton(
                  iconSize: 50,
                  onPressed: (){
                    setState(() {
                      isDote5 = ! isDote5;
                      if(isDote1== false)
                        isDote1= true;
                      if(isDote2== false)
                        isDote2= true;
                      if(isDote3== false)
                        isDote3= true;
                      if(isDote4== false)
                        isDote4= true;
                    });
                  },
                  color: isDote5==false? Colors.grey:Colors.yellow,
                  icon: Icon(isDote5==false?Icons.star_border:Icons.star),
                ),
              ],
            ),
            SizedBox(height: height * .044),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 130),
              child: Builder(
                builder: (context) => MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(color: KTherdycolor),
                  ),
                  onPressed: () async {
                   if( AppCubit.get(context).isDoc == false)
                    navigatePOp ( context, const HomeScreen());
                else
                    navigatePOp ( context, const DocHomeScreen());
                    },
                  color: KTherdycolor,
                  child: const Text (
                    'تم',
                    style: TextStyle(color: KSeconedarycolor ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
