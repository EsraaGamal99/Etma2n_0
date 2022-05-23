import 'package:etma2n/MOVE_ON/move_on_home.dart';
import 'package:etma2n/doctor_schedule/doctor.dart';
import 'package:etma2n/layout/consultation/cons_home.dart';
import 'package:etma2n/layout/test/test_home.dart';
import 'package:etma2n/todo_list/toDoHome.dart';
import 'package:flutter/material.dart';

import 'shared/component/components.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                navigateTo(context, Doctor());
              },
              icon: const Icon(
                Icons.add,
              )),
        ],
         /* title: Text(
          'الصفحه الرئيسية',
        ),*/
          ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildCart(
                  function: () {
                    navigateTo(
                      context,
                      const TestHome(),
                    );
                  },
                  imageLink:
                      'https://mbc-news.com/wp-content/uploads/2021/02/f834ffb723ff729f4d0610b176afef10.png',
                ),
                const SizedBox(
                  height: 15.0,
                ),
                buildCart(
                  function: () {
                    navigateTo(
                      context,
                      const ConsHome(),
                    );
                  },
                  imageLink:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDnFVpWtJI9sbb2v88jZpxhITLQEz9hB-h7kcdkMqYZGW9KtGbe6hJpiyWNR2n5lK02Us&usqp=CAU',
                ),
                const SizedBox(
                  height: 15.0,
                ),
                buildCart(
                  function: () {
                    navigateTo(
                      context,
                     MoveonHomePage(),
                    );
                  },
                  imageLink:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDnFVpWtJI9sbb2v88jZpxhITLQEz9hB-h7kcdkMqYZGW9KtGbe6hJpiyWNR2n5lK02Us&usqp=CAU',
                ),
                buildCart(
                  function: () {
                    navigateTo(
                      context,
                      TodoHomeScreen(),
                    );
                  },
                  imageLink:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDnFVpWtJI9sbb2v88jZpxhITLQEz9hB-h7kcdkMqYZGW9KtGbe6hJpiyWNR2n5lK02Us&usqp=CAU',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
