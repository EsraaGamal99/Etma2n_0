
import 'package:etma2n/home.dart';
import 'package:etma2n/login/login_cubit/cubit.dart';
import 'package:etma2n/login/login_cubit/states.dart';
import 'package:etma2n/login/screen/forgetting_password.dart';
import 'package:etma2n/shared/component/components.dart';
import 'package:etma2n/widgets/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/styles/colors.dart';

//import 'register_screen.dart';


import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'LoginScreen';
  static String doctorPassword = 'DOCTOR#P@SSWORD';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isDoctor = false;
  TextEditingController emcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  //late String email, password;
  bool isPassword= true;
  static const values = <String> [ 'مستخدم','طبيب'];
  String selectedValue = values.first;
  final selectedColor = KSeconedarycolor;
  final unselectedColor = Colors.blueGrey;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: KTherdycolor,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [

                customImageField(
                  height: MediaQuery.of(context).size.height * .25,
                  image: const AssetImage('assets/images/etmaan.png'),
                ),
                SizedBox(height: height * .045),

               //الايميل
               defaultFormField1 (
                   controller: emcontroller,
                   type: TextInputType.emailAddress,
                   validate: (value)
                   {
                     if(value.isEmpty)
                     {
                       return 'البريد غير صحيح';}
                     },
                   label: 'البريد',
                   prefix: Icons.email_outlined),


                SizedBox(height: height * .015),

                //كلمة السر
                defaultFormField1(
                  controller: passcontroller,
                  label: 'كلمة السر',
                  prefix: Icons.lock,
                  suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                  isPassword: isPassword,
                  suffixPressed: ()
                  {
                    setState(()
                    {
                      isPassword = !isPassword;
                    });
                  },
                  type: TextInputType.visiblePassword,
                  validate: (String value)
                  {
                    if(value.isEmpty)
                    {
                      return 'password is too short';
                    }

                    return null;
                  },
                ),

                // button login
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 130),
                  child: Builder(
                    builder: (context) => MaterialButton(
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

                SizedBox(height: height * .018),

                //user or doctor
                buildRadios(),


                SizedBox(height: height * .05),

                //forget password
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context)
                        => const ForgettingPassword()),);
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
                      onTap: () { navigateTo ( context, RegisterScreen());},
                      child: const Text(
                        'تسجيل',
                        style: TextStyle(
                          color: KSeconedarycolor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



  Widget buildRadios() => Row(
    children: values.map(
          ( value) {
        return RadioListTile<String>(
            value: value,
            groupValue: selectedValue,
            title: Row(
              children: [
                Text(value,style: const TextStyle(color: KSeconedarycolor,fontWeight: FontWeight.bold),),
              ],
            ),
            activeColor: selectedColor,
            onChanged: (value) {
              setState(() {
                selectedValue = value!;
                if(selectedValue=='طبيب') {
                  isDoctor=! isDoctor;
                }
              });
            }
        );
      },
    ).toList(),
  );
}
