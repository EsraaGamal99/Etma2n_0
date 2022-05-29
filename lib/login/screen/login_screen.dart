
import 'package:etma2n/home.dart';
import 'package:etma2n/shared/component/components.dart';
import 'package:flutter/material.dart';
import '../../widgets/components.dart';
import '../constant/constant.dart';
import 'forgetting_password.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'LoginScreen';
  static String doctorPassword = 'DOCTOR#P@SSWORD';
  bool isDoctor = false;
  var email= TextEditingController(), password = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

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
              onPressed: (){},
                icon: Icons.email,
                hint: 'الايميل'),
            SizedBox(height: height * .040),

            //كلمة السر
            customTextField(
                controller: password,
                type: TextInputType.visiblePassword,
              onPressed: (){

              },
                icon: Icons.lock,
                icon1: Icons.remove_red_eye,
                hint: 'كلمة السر'),
            SizedBox(height: height * .060),
///
            // button login
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 130),
              child: Builder(
                builder: (context) => FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(color: KTherdycolor),
                  ),
                  onPressed: () async {

                    navigateTo ( context,const HomeScreen());},
                  color: KSeconedarycolor,
                  child: const Text(
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
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context)
                    => ForgettingPassword()),);
                  print('هل نسيت كلمة السر !!!!!!');
                },
                child: const Text(
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
                const Text(
                  'ليس لديك حساب ؟ ',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () { navigateTo ( context,const RegisterScreen());},
                  child: const Text(
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
