import 'package:etma2n/shared/component/components.dart';
import 'package:flutter/material.dart';
import '../../shared/styles/colors.dart';
import '../../widgets/components.dart';
import 'login_screen.dart';

class ForgettingPassword extends StatefulWidget {
  static String id = 'LoginScreen';

  const ForgettingPassword({Key? key}) : super(key: key);

  @override
  State<ForgettingPassword> createState() => _ForgettingPasswordState();
}

class _ForgettingPasswordState extends State<ForgettingPassword> {
  bool isDoctor = false;

  late String email;

  late var emcontroller=TextEditingController();

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
              height: MediaQuery.of(context).size.height * .33,
              image: const AssetImage('assets/images/etmaan.png'),
            ),
            SizedBox(height: height * .045),

            //الايميل
            defaultFormField1(
                controller: emcontroller,
                type: TextInputType.emailAddress,
                validate: (String value) {
                  if (value.isEmpty) {
                    return 'البريد فارغ';
                  }
                  return null;
                },
                label: 'البريد',
                prefix: Icons.email_outlined),

            SizedBox(height: height * .044),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 130),
              child: Builder(
                builder: (context) => MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(color: KTherdycolor),
                  ),
                  onPressed: () async {navigateTo ( context, LoginScreen());},
                  color: KSeconedarycolor,
                  child: const Text (
                    'استرجاع',
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
