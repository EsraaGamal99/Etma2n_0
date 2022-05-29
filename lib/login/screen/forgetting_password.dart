import 'package:etma2n/home.dart';
import 'package:etma2n/shared/component/components.dart';
import 'package:flutter/material.dart';
import '../../widgets/components.dart';
import '../constant/constant.dart';

//
class ForgettingPassword extends StatelessWidget {
  static String id = 'LoginScreen';
  bool isDoctor = false;
   var email = TextEditingController();

  ForgettingPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: KTherdycolor,
        body: ListView(
          children: <Widget>[
            customImageField(
              height: MediaQuery.of(context).size.height * .3,
              image: const AssetImage('assets/images/etmaan.png'),
            ),
            SizedBox(height: height * .045),

            //الايميل
            customTextField(
                controller: email,
                type: TextInputType.emailAddress,
                /*onClick: (value) {
                  email = value;
                },*/
                icon: Icons.email,
                hint: 'الايميل'),

            SizedBox(height: height * .040),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 130),
              child: Builder(
                builder: (context) => FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(color: KTherdycolor),
                  ),
                  onPressed: () async {navigateTo ( context,const HomeScreen());},
                  color: KSeconedarycolor,
                  child: const Text (
                    'تأكيد',
                    style: TextStyle(color: KTherdycolor),
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
