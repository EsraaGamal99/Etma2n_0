
import 'package:etma2n/home.dart';
import 'package:etma2n/shared/component/components.dart';
import 'package:flutter/material.dart';
import '../Settings/main_setting_page.dart';
import '../widgets/constant.dart';


class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  //static const pics = <String>['Credit Card', 'Fawry', 'Vodafone Cash'];
  static const values = <String> ['https://upload.wikimedia.org/wikipedia/commons/4/41/Visa_Logo.png', 'https://arqqa.net/wp-content/uploads/2016/06/fawry.png', 'https://toppng.com/uploads/preview/vodafone-plc-vector-logo-free-download-11574016606ng1zboclos.png'];
  String selectedValue = values.first;
  final selectedColor = Colors.indigo;
  final unselectedColor = Colors.blueGrey;
  var codecontroller = TextEditingController();
  var emailcontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  late ImageProvider? image;
  late String hint;

  //  late List <IconData> icon = [Icons.credit_card_outlined,Icons.paypal,Icons.voicemail_sharp];

  /*  Widget  back () {
    if (selectedValue == values[0]) {
      image:const NetworkImage('https://upload.wikimedia.org/wikipedia/commons/4/41/Visa_Logo.png');
      buildCardBox();
    }
    if (selectedValue == values[1]) {
      image:const NetworkImage('https://arqqa.net/wp-content/uploads/2016/06/fawry.png');
      buildFawryBox();
    }
    if (selectedValue == values[2]) {
      image: const NetworkImage('https://toppng.com/uploads/preview/vodafone-plc-vector-logo-free-download-11574016606ng1zboclos.png');
      buildVodafoneBox();}
  }
  */


  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(

          title: const Text(
            'الدفع',

          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.settings,

              ),
              onPressed: () {
                navigateTo(context, const SettingScreen());
                },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 20,),
                buildRadios(),
                const SizedBox(height: 44,),
              if (selectedValue == values[0])
                buildCardBox(),
              if (selectedValue == values[1])
                buildFawryBox(),
              if (selectedValue == values[2])
                buildVodafoneBox(),

                const SizedBox(height: 55,),

                MaterialButton(
                   height: 50,
                   minWidth: 120,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: const BorderSide(color: KTherdycolor),
                    ),
                    onPressed: () async {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                          builder: (context) => HomeScreen(),),);
                     },
                    color: KSeconedarycolor,
                    child: const Text(
                      'تم',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget buildRadios() => Column(
    children: values.map(
          ( value) {
        //final selected = selectedValue == value;
        //final color = selected ? selectedColor : unselectedColor;

        return RadioListTile<String>(

          value: value,
          groupValue: selectedValue,
          title: Row(
            children: [
              Image(image: NetworkImage(value),height: 50,width: 50,),
/*
              Text(
                value,
                style: TextStyle(color: color),
              ),
*/

            ],
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

  Widget buildCardBox() => Material(
    elevation: 11.0,
    borderRadius: BorderRadius.circular(20),
    shadowColor: KSeconedarycolor,
    child: Container(
      height: 200,
      padding: const EdgeInsets.only(right: 10, left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Colors.grey,Colors.white24],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Credit Card' , style: TextStyle(color: KSeconedarycolor , fontSize: 15, fontWeight: FontWeight.w700),),
          const SizedBox(height: 8,),
          buildTextForm(width1: double.infinity,label: 'رقم البطاقة', controller: codecontroller, type: TextInputType.number),
          const SizedBox(height: 20,),
          Row(
            children: [
              buildTextForm(label: 'تاريخ الانتهاء', width1: 190, type: TextInputType.datetime),
              const Spacer(),
              buildTextForm(label: 'CVC', width1: 80, type: TextInputType.number)
            ],
          ),
        ],
      ),
    ),
  );

  Widget buildFawryBox() => Material(
    elevation: 11.0,
    borderRadius: BorderRadius.circular(20),
    shadowColor: KSeconedarycolor,
    child: Container(
      height: 200,
      padding: const EdgeInsets.only(right: 10, left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Colors.grey,Colors.white24],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Fawry' , style: TextStyle(color: KSeconedarycolor , fontSize: 15, fontWeight: FontWeight.w700),),
          const SizedBox(height: 8,),
          buildTextForm(label: 'البريد', width1: double.infinity, controller: emailcontroller, type: TextInputType.emailAddress),
          const SizedBox(height: 20,),
          buildTextForm(width1: double.infinity,label: 'رقم الهاتف', controller: phonecontroller, type: TextInputType.phone),
        ],
      ),
    ),
  );

  Widget buildVodafoneBox() => Material(
    elevation: 11.0,
    borderRadius: BorderRadius.circular(20),
    shadowColor: KSeconedarycolor,
    child: Container(
      height: 180,
      padding: const EdgeInsets.only(right: 10, left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Colors.grey,Colors.white24],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Vodafone Cash' , style: TextStyle(color: KSeconedarycolor , fontSize: 15, fontWeight: FontWeight.w700),),
          const SizedBox(height: 8,),
          buildTextForm(width1: double.infinity,label: 'رقم الهاتف', controller: phonecontroller, type: TextInputType.phone),
          const SizedBox(height: 11,),
          const Text('أرسل رصيدًا إلى رقم فودفون كاش  01012345678',
            style: TextStyle(
                color: KSeconedarycolor,
                fontSize: 15,
                fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ),
  );

  Widget buildTextForm({required String label ,required double width1, TextEditingController? controller, required type}) =>
      SizedBox(
    width: width1,
    child: Material(
      elevation: 8.0,
      borderRadius: BorderRadius.circular(20),
      shadowColor: KSeconedarycolor,
      child: TextFormField(
        cursorColor: KSeconedarycolor,
        controller:controller,
        keyboardType: type,
        decoration: InputDecoration(
          hintText: label,
          filled: true,
          fillColor: Colors.white30,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: KSeconedarycolor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: KSeconedarycolor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: KSeconedarycolor),
          ),
        ),
      ),
    ),
  );
}


