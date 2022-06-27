
import 'package:etma2n/login/screen/login_screen.dart';
import 'package:etma2n/shared/AppCubit/cubit.dart';
import 'package:etma2n/shared/component/components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../models/setting_models.dart';
import '../shared/styles/colors.dart';
import '../widgets/components.dart';

import 'edit_profile.dart';
import 'favourites.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text(
            'الإعدادات',
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 44,
              ),
              //user pic
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 15,
                        color: KSeconedarycolor,
                        spreadRadius: 4),
                  ],
                ),
                child: Stack(alignment: Alignment.center, children: [
/*
                    Positioned(
                      top: 50,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey.shade700,
                        //backgroundImage:
                        //const NetworkImage('https://i.pinimg.com/736x/08/32/e5/0832e515d15c0aea2be94bf942f6aa72.jpg'),
                      ),
                    ),
*/

                  const CircleAvatar(
                    radius: 60.0,
                    backgroundImage: NetworkImage(
                        'https://i.pinimg.com/736x/08/32/e5/0832e515d15c0aea2be94bf942f6aa72.jpg'),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      top: 105.0,
                      start: 70.0,
                    ),
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: const BoxDecoration(
                        color: KSeconedarycolor,
                        shape: BoxShape.circle,
                        //boxShadow: [BoxShadow(blurRadius: 15, color: KSeconedarycolor, spreadRadius: 6)],
                      ),
                      child: Icon(
                        Icons.photo_camera,
                        size: 35,
                        color: Colors.grey[350],
                      ),
                    ),
                  ),
                ]),
              ),

              //user name
              Container(
                padding: const EdgeInsets.only(top: 8),
                child: const Center(
                  child: Text(
                    'مريم جابر',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              // edit button
              Container(
                height: 50,
                width: 110,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  //boxShadow: [BoxShadow(blurRadius: 15, color: KSeconedarycolor, spreadRadius: 6)],
                ),
                child: MaterialButton(
                  onPressed: () {
                    navigateTo(context, const EditProfile());
                  },
                  color: KSeconedarycolor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: const [
                      Text(
                        'تعديل',
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
                        Icons.edit,
                        color: Colors.white,
                        // size: 15,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),

          /*    //break
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(7),
                ),
                padding: const EdgeInsets.only(right: 25, left: 15),
                child: Expanded(
                  child: Text(
                    'المحتوى',
                    style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                  ),
                ),
              ),*/

         /*     //favorites
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const Icon(Icons.favorite_outline_rounded,size:30),
                    const SizedBox(width: 15,),
                    const Text(
                      'المفضلة',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          navigateTo(context, const Favourites());},
                        icon: const Icon(Icons.arrow_forward_ios,)),
                  ],
                ),
              ),
*/
              // break
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(7),
                ),
                padding: const EdgeInsets.only(right: 25, left: 15),
                child: Expanded(
                  child: Text(
                    'أداء',
                    style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                  ),
                ),
              ),

              // dark mode
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    const Icon(Icons.dark_mode_outlined,size: 30,),
                    const SizedBox(width: 15,),
                    Text(
                      'الوضع المظلم',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 25,
                      //width: 61,
                      child: ToggleSwitch(
                        minWidth: 25.0,
                        cornerRadius: 28.0,
                        activeBgColors: const [
                          [KSeconedarycolor],
                          [KTherdycolor],
                        ],
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey[500],
                        inactiveFgColor: Colors.white,
                        initialLabelIndex: 1,
                        totalSwitches: 2,
                        //labels: const ['Off','On'],
                        radiusStyle: true,
                        onToggle: (index) {
                          AppCubit.get(context).changeAppMode();
                          if (kDebugMode) {
                            print('switched to: $index');
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),

              myLine(Colors.grey[100]!),
              const SizedBox(height: 15,),

              // settings
              ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildSettingCard(
                    title: settings[index].mtitle,
                    icon: settings[index].micon,
                    /*onClick: () {
                      navigateTo(context, Settings(setindex: index,));
                    }*/
                    ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 1,
                ),
                itemCount: settings.length,
              ),
              const SizedBox(height: 15,),
              myLine(Colors.grey[100]!),

              // logout
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: GestureDetector(
                  onTap: () async {
                    //await auth.signOut();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                  child: Row(
                    children: [
                      const Text(
                        'تسجيل خروج',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          color: KSeconedarycolor,
                          shape: BoxShape.circle,
                          //boxShadow: [BoxShadow(blurRadius: 15, color: KSeconedarycolor, spreadRadius: 6)],
                        ),
                        child: IconButton(
                          onPressed: () async {
                            //await auth.signOut();
                            navigateTo(context, const LoginScreen());
/*
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
*/
                          },
                          icon: const Icon(Icons.logout_rounded,color: Colors.white,),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}


