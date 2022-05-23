import 'package:etma2n/layout/consultation/add_new_cons.dart';
import 'package:etma2n/shared/component/components.dart';
import 'package:flutter/material.dart';


class ConsHome extends StatelessWidget {
  const ConsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'استشارات نفسية طبيه',
          ),
          actions: [
            IconButton(
                onPressed: () {
                  navigateTo(context, AddNewCons());
                },
                icon: const Icon(
                  Icons.add,
                )),
          ],
        ),
        body: consBuilder(context),
      ),
    );
  }
}
