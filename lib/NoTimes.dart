import 'package:etma2n/login/constant/constant.dart';
import 'package:flutter/material.dart';
class NoTime extends StatelessWidget {
  const NoTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: KSeconedarycolor,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "لا يوجد مواعيد",
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      ),
    );
  }
}
