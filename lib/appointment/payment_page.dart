import 'package:flutter/material.dart';

import '../login/constant/constant.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);


  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  static const values = <String>['Credit Card', 'Fawry', 'Vodafone Cash'];
  String selectedValue = values.first;

  final selectedColor = Colors.indigo;
  final unselectedColor = Colors.blueGrey;

  late String hint;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Flexible(
          child: Expanded(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                leading:IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color(0xFF5271ff),
                    ),
                  onPressed: () {},
                ),
                title: const Text(
                  'الدفع',
                  style: TextStyle(
                    color: Color(0xFF5271ff),
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: Color(0xFF5271ff),
                    ),
                    onPressed: () {
                      print('setting opened');
                    },
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      buildRadios(),
                      const Spacer(),

 /*                     floatingActionButton: FloatingActionButton(
                        // backgroundColor: Colors.purpleAccent,
                        onPressed: () {
                          if (ToDoCubit.get(context).isBottomSheetShow) {
                            if (formkey.currentState.validate()) {
                              ToDoCubit.get(context).insertdb(
                                  title: titelecontroller.text,
                                  time: timecontroller.text,
                                  date: datecontroller.text);
                            }
                          }
                          else {
                            scaffoldkey.currentState
                                .showBottomSheet(
                                  (context) => Container(
                                color: Colors.white,
                                padding: const EdgeInsets.all(20.0),
                                child: SingleChildScrollView(
                                  child: Form(
                                    key: formkey,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        defaultDateFormField(
                                          controller: titelecontroller,
                                          type: TextInputType.text,
                                          validate: (String value) {
                                            if (value.isEmpty) {
                                              return 'الاسم فارغ';
                                            }
                                            return null;
                                          },
                                          label: 'اسم المهمه',
                                          prefix: Icons.task_alt_rounded,
                                        ),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                        defaultDateFormField(
                                          controller: timecontroller,
                                          type: TextInputType.datetime,
                                          validate: (String value) {
                                            if (value.isEmpty) {
                                              return 'الوقت فارغ';
                                            }
                                            return null;
                                          },
                                          onTap: () {
                                            showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay.now(),
                                            ).then((value) {
                                              timecontroller.text =
                                                  value.format(context).toString();
                                              print(value.format(context));
                                            });
                                          },
                                          label: ' وقت المهمه',
                                          prefix: Icons.watch_later_outlined,
                                        ),
                                        const SizedBox(
                                          height: 15.0,
                                        ),
                                        defaultDateFormField(
                                          controller: datecontroller,
                                          type: TextInputType.datetime,
                                          validate: (String value) {
                                            if (value.isEmpty) {
                                              return 'التاريخ فارغ';
                                            }
                                            return null;
                                          },
                                          onTap: () {
                                            showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.now(),
                                              lastDate:
                                              DateTime.parse('2028-12-01'),
                                            ).then((value) {
                                              datecontroller.text =
                                                  DateFormat.yMMMd().format(value);
                                            });
                                          },
                                          label: 'تاريخ المهمه',
                                          prefix: Icons.calendar_today_outlined,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              elevation: 20.0,
                            )
                                .closed
                                .then((value) {
                              ToDoCubit.get(context)
                                  .changeBottomsheet(isShow: false, icon: Icons.edit);
                            });
                            ToDoCubit.get(context)
                                .changeBottomsheet(isShow: true, icon: Icons.add);
                          }
                        },
                        child: Icon(
                          ToDoCubit.get(context).fab,
                        ),
                      ),
*/

//                buildCardBox(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget buildRadios() => Column(
    children: values.map(
          (value) {
        final selected = selectedValue == value;
        final color = selected ? selectedColor : unselectedColor;

        return RadioListTile<String>(
          value: value,
          groupValue: selectedValue,
          title: Text(
            value,
            style: TextStyle(color: color),
          ),
          activeColor: selectedColor,
          onChanged: (value) {
            setState(() {
              selectedValue = value!;
            });
          }
        );
      },
    ).toList(),
  );


  Widget buildCardBox() => Container(
    height: 100,
    padding: const EdgeInsets.only(right: 20, left: 20, bottom: 0),
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Colors.grey,Colors.indigo],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child:Column(
      children: [
        Material(
          elevation: 8.0,
          borderRadius: BorderRadius.circular(20),
          shadowColor: KSeconedarycolor,
          child: TextFormField(
            cursorColor: KSeconedarycolor,
            decoration: InputDecoration(
              hintText: 'Card number',
              filled: true,
              fillColor: Colors.white70,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: KSeconedarycolor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: KSeconedarycolor),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: KSeconedarycolor),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}


