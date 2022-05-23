import 'package:etma2n/home.dart';
import 'package:etma2n/login/constant/constant.dart';
import 'package:etma2n/login/widget/imagefield.dart';
import 'package:etma2n/login/widget/textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  //final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  static String id = 'LoginScreen';

  //final _auth = Auth();
  final doctorPassword = 'DOCTOR#P@SSWORD';
  bool isDoctor = false;
  late String email, password;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: KTherdycolor,
        body: ListView(
          children: <Widget>[
            CustomImageField(
              image: AssetImage('assets/images/etmaan.png'),
            ),
            SizedBox(height: height * .045),

            //الايميل
            CustomTextField(
                onClick: (value) {
                  email = value!;
                },
                icon: Icons.email,
                hint: 'الايميل'),
            SizedBox(height: height * .040),

            //كلمة السر
            CustomTextField(
                onClick: (value) {
                  password = value!;
                },
                icon: Icons.lock,
                icon1: Icons.remove_red_eye,
                onPressed: () {},
                hint: 'كلمة السر'),
            SizedBox(height: height * .060),

            // button login
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 130),
              child: Builder(
                builder: (context) => FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: KTherdycolor),
                  ),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  color: KSeconedarycolor,
                  child: Text(
                    'تسجيل الدخول',
                    style: TextStyle(color: KTherdycolor),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * .025),

            //forget password
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                  print('هل نسيت كلمة السر !!!!!!');
                },
                child: Text(
                  'هل نسيت كلمة السر؟',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            SizedBox(height: height * .015),

            //لديك حساب؟؟
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ليس لديك حساب ؟ ',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  child: Text(
                    'تسجيل',
                    style: TextStyle(
                      color: KButtomcolor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
