// @dart=2.9

import 'package:etma2n/doctor_schedule/cubit/cubit.dart';
import 'package:etma2n/doctor_schedule/doctor.dart';
import 'package:etma2n/doctor_calender.dart';
import 'package:etma2n/home.dart';
import 'package:etma2n/layout/test/cubit/cubit.dart';
import 'package:etma2n/layout/test/cubit/states.dart';
import 'package:etma2n/login/login_cubit/cubit.dart';
import 'package:etma2n/login/reg_cubit/cubit.dart';
import 'package:etma2n/login/screen/login_screen.dart';
import 'package:etma2n/nada.dart';
import 'package:etma2n/todo_list/toDoHome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()  {
  //WidgetsFlutterBinding.ensureInitialized();

  /*await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );*/
///////////
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const MaterialColor nada = MaterialColor(
      0xff576dca,
      <int, Color>{
        50: Color(0xff576dca),
        100: Color(0xff576dca),
        200: Color(0xff576dca),
        300: Color(0xff576dca),
        400: Color(0xff576dca),
        500: Color(0xff576dca),
        600: Color(0xff576dca),
        700: Color(0xff576dca),
        800: Color(0xff576dca),
        900: Color(0xff576dca),
      },
    );
    Color mainColor = const Color(0xffa9c1f7);
    Color secondColor = const Color(0xff576dca);
    return MultiBlocProvider(
      providers: [
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
      child: BlocConsumer<TestCubit, TestStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                primarySwatch: nada,
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
              ),
              /*color: Colors.deepPurpleAccent,
              theme: ThemeData(
                primaryColorLight: Colors.deepPurpleAccent,
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: const AppBarTheme(
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      //systemNavigationBarIconBrightness: ,
                      statusBarIconBrightness: Brightness.dark),
                  titleTextStyle: TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  iconTheme: IconThemeData(
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  backgroundColor: Colors.white,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepPurpleAccent,
                  elevation: 15.0,
                ),
                primaryColor: Colors.deepPurpleAccent,
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepPurpleAccent,
                ),
                textTheme: const TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              darkTheme: ThemeData(
                primaryColorLight: Colors.deepPurpleAccent,
                scaffoldBackgroundColor: Colors.black54,
                appBarTheme: const AppBarTheme(
                  // ignore: deprecated_member_use
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.black45,
                      //systemNavigationBarIconBrightness: ,
                      statusBarIconBrightness: Brightness.light),
                  titleTextStyle: TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                  backgroundColor: Colors.black45,
                  elevation: 0.0,
                  iconTheme: IconThemeData(
                    color: Colors.deepPurpleAccent,
                  ),
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  backgroundColor: Colors.black54,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepPurpleAccent,
                  unselectedItemColor: Colors.white60,
                  elevation: 15.0,
                ),
                primaryColor: Colors.deepPurpleAccent,
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepPurpleAccent,
                ),
                textTheme: const TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
              themeMode: AppCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,*/
              debugShowCheckedModeBanner: false,
              home: Directionality(
                textDirection: TextDirection.rtl,
                child: LoginScreen(),
              ),
            );
          }),
    );
  }
}
