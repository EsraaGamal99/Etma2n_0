// @dart=2.9

import 'package:etma2n/appointment/menu_doctors.dart';
import 'package:etma2n/doctor_schedule/cubit/cubit.dart';
import 'package:etma2n/doctor_schedule/doctor.dart';
import 'package:etma2n/doctor_calender.dart';
import 'package:etma2n/home.dart';
import 'package:etma2n/layout/test/cubit/cubit.dart';
import 'package:etma2n/layout/test/cubit/states.dart';
import 'package:etma2n/login/constant/constant.dart';
import 'package:etma2n/login/login_cubit/cubit.dart';
import 'package:etma2n/login/reg_cubit/cubit.dart';
import 'package:etma2n/login/screen/login_screen.dart';
import 'package:etma2n/shared/AppCubit/states.dart';
import 'package:etma2n/shared/network/local/cache_helper.dart';
//import 'package:etma2n/widgets/sessionaudio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';
import 'shared/AppCubit/cubit.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized(); //علشان نتأكد ان حصل Intialize
                                            // قبل م ن RUN البروجيكت
  await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.init();

  bool isDark = CacheHelper.getBoolean(key: 'isDark');

  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool isDark;

  const MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    const MaterialColor ThemeColor = MaterialColor(
      0xFF5271ff,
      <int, Color>{
        50: Color(0xFF5271ff),
        100: Color(0xFF5271ff),
        200: Color(0xFF5271ff),
        300: Color(0xFF5271ff),
        400: Color(0xFF5271ff),
        500: Color(0xFF5271ff),
        600: Color(0xFF5271ff),
        700: Color(0xFF5271ff),
        800: Color(0xFF5271ff),
        900: Color(0xFF5271ff),
      },
    );
    var mainColor =  Color(0xffa9c1f7);
    const KButtomcolor = Color(0xFF2b44f7);
    var secondColor =  Color(0xFF5271ff);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit()
            ..changeAppMode(
              fromShared: isDark,
            ),
        ),
        BlocProvider(
          create: (BuildContext context) => TestCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => DoctorScheduleCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => LoginCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => RegisterCubit(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                primarySwatch: ThemeColor,
                appBarTheme: AppBarTheme(
                  backgroundColor: Colors.white,
                  iconTheme: IconThemeData(
                    color: secondColor,
                  ),
                  titleTextStyle: TextStyle(
                    color: secondColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  elevation: 0.0,
                  systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                ),

                backgroundColor: Colors.white,
                primaryColor: secondColor,
                textTheme: const TextTheme(
                  headline1: TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.bold, color:Colors.black,),
                  headline6: TextStyle(fontSize: 11.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  bodyText2: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              darkTheme: ThemeData(
                primarySwatch: ThemeColor,

                scaffoldBackgroundColor: Colors.black54,
                appBarTheme: const AppBarTheme(
                  // ignore: deprecated_member_use
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.black45,
                      //systemNavigationBarIconBrightness: ,
                      statusBarIconBrightness: Brightness.light),
                  titleTextStyle: TextStyle(
                    color: KSeconedarycolor,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Colors.black45,
                  elevation: 0.0,
                  iconTheme: IconThemeData(
                    color:KSeconedarycolor,
                  ),
                  actionsIconTheme: IconThemeData(
                    color: KSeconedarycolor,
                  ),

                ),
                  textTheme: const TextTheme(
                    headline1: TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold, color:Colors.white,),
                    headline6: TextStyle(fontSize: 11.0,
                    fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    bodyText2: TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  backgroundColor: Colors.black54,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: KSeconedarycolor,
                  unselectedItemColor: Colors.white60,
                  elevation: 15.0,
                ),
                primaryColor:KSeconedarycolor,
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: KSeconedarycolor,
                ),
                backgroundColor: Colors.black54
              ),
              themeMode: AppCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              debugShowCheckedModeBanner: false,
              home: const Directionality(
                textDirection: TextDirection.rtl,
                child: LoginScreen(),
              ),
            );
          }),
    );
  }
}
