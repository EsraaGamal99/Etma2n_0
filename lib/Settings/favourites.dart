import 'package:flutter/material.dart';

import '../widgets/constant.dart';

class Favourites extends StatelessWidget{
  const Favourites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            elevation: 1.0,
            backgroundColor: Colors.white, //const Color(0xFF5271ff),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios),
              color: KSeconedarycolor,
            ),
            title: const Text(
              'المفضلة',
              style: TextStyle(
                color: KSeconedarycolor, //Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children:  [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Row(
                    children: const [
                      Center(
                          child: Text('FAVOURITES')
                      ),
                    ],
                  ),
                  separatorBuilder: (context, index) => const SizedBox(height: 10,),
                  itemCount: 11
                ),
              ],
            ),
          ),
        ),
    );
  }

}