import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:etma2n/layout/consultation/cons_home.dart';
import 'package:etma2n/shared/component/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddNewCons extends StatefulWidget {
  const AddNewCons({Key? key}) : super(key: key);

  @override
  State<AddNewCons> createState() => _AddNewConsState();
}

class _AddNewConsState extends State<AddNewCons> {
  @override
  Widget build(BuildContext context) {
    var newConsController = TextEditingController();
    Color mainColor = const Color(0xffa9c1f7);
    Color secondColor = const Color(0xff576dca);
    //doctors name
    List<String> items = [
      'Dr1',
      'Dr2',
      'Dr3',
      'Dr4',
      'Dr5',
    ];
    String? selectedDoctor = "Dr1";
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
               child:  Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: secondColor,
                              width: 4,
                            )),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: selectedDoctor,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedDoctor = newValue!;
                            });
                          },
                          items: items
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      defaultFormField(
                        controller: newConsController,
                        type: TextInputType.text,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return "السؤال فارغ";
                          }
                          return null;
                        },
                        label: 'اكتب سؤالك',
                      ),
                    ],
                  ),
                ),
               ),
              ),
              MaterialButton(
                shape: const StadiumBorder(),
                color: secondColor,
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                //بكتب الفانكشن اللى هتخزن وتبعت السؤال للدكتور
                onPressed: () {

                  navigateTo(context, ConsHome());
                },
                child: const Text(
                  'ارسال',
                  style: TextStyle(
                    color: Colors.white70,
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
