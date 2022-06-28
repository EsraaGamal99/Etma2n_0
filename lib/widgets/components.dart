import 'package:date_field/date_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'constant.dart';

Widget moveonCard({
  required Function() onClick,
  required String title,
  required String description,
  required ImageProvider image1,
}) =>
    GestureDetector(
      onTap: onClick,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shadowColor: Colors.black,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(

          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF5271ff), Colors.black12],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Row(
            children: [

              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Image(
                  image: image1,
                  height: 66,
                  width: 66,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 23.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      description,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13.5,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );

Widget motivationCard({
  required Function() onClick,
  double? height1,
  ImageProvider? image1,
  String? title,
  Color? color1,
  Color? color2,
  String? description,
}) =>
    GestureDetector(
      onTap: onClick,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shadowColor: Colors.black,
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            //background image
            Ink.image(
              image: image1!,
              fit: BoxFit.cover,
              height: 170,
              child: InkWell(
                onTap: onClick,
              ),
            ),

            Container(
              height: 170,
              padding: const EdgeInsets.only(right: 20, left: 20, bottom: 0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [color1!, color2!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children: [
                  // icon of motivation

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 95, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          // description of motivation
                          Container(
                            height: 25,
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.elliptical(10, 10),
                                ),
                              ),
                              color: Colors.white24,
                            ),
                            child: Text(
                              description!,
                              style: const TextStyle(
                                //backgroundColor: Colors.grey,
                                color: Colors.white,
                                //fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

Widget articleCard({
  required Function() onClick,
  ImageProvider? image1,
  String? title,
  String? owner,
  String? hour,
  String? thearticle,
  Function()? onTop,
  //bool? isFav,
  bool? isColor,
}) =>
    GestureDetector(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shadowColor: const Color(0xFF5271f0),
          elevation: 3.5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Container(
            height: 220,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                // owner
                Row(
                  children: [
                    Expanded(
                      child: Row(children: [
                        CircleAvatar(
                          radius: 25.0,
                          backgroundImage: image1,
                        ),
                        const SizedBox(
                          width: 12.5,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // owner name
                            Text(
                              owner!,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            // time
                            Text(
                              hour!,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ]),
                    ),
                   // IconButton(
                   //      iconSize: 30,
                   //      color: isColor != true ? Colors.black45 : Colors.red,
                   //      icon: Icon(
                   //        isFav != true
                   //            ? Icons.favorite_border_rounded
                   //            : Icons.favorite,
                   //      ),
                   //      onPressed: onClick),
                  ],
                ),

                //article
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        thearticle!,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 230),
                        child: TextButton(
                          onPressed: onClick,
                          child: const Text(
                            'أقرا المزيد',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

Widget myLine(Color color1) => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
        end: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 2,
        color: color1,
      ),
    );

Widget mySession({
  bool isPlay = false,
  bool isFav = false,
  Color? color1,
  double? height1,
  required Function() onClick,
  bool isColor = false,
  String? sessionTitle,
}) =>
    Padding(
      padding: const EdgeInsets.only(right: 15, left: 20, bottom: 5, top: 5),
      child: Center(
        child: Row(
          children: [
            IconButton(
              iconSize: 30,
              color: isColor != true ? Colors.white : Colors.red,
              icon: Icon(
                isFav != true ? Icons.favorite_border_rounded : Icons.favorite,
              ),
              onPressed: onClick,
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sessionTitle!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                isPlay != true
                    ? Icons.play_circle_outline_rounded
                    : Icons.pause_circle_outline_rounded,
              ),
              color: Colors.white,
              iconSize: 35,
              onPressed: onClick,
            ),
          ],
        ),
      ),
    );

Widget booksCard({
  required Function() onClick,
  ImageProvider? image1,
  String? title,
  String? writer,
  String? description,
}) =>
    GestureDetector(
      onTap: onClick,
      child: Column(
        children: [
          SizedBox(height:25.0,),
          Row(
            children: [
              Image(
                image: image1!,
                height: 100,
              ),
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 6.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // description
                        Expanded(
                          child: Text(
                            description!,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        // writer
                        Padding(
                          padding: const EdgeInsets.only(right: 15, top: 35),
                          child: Text(
                            writer!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height:25.0,),
        ],
      ),
    );

Widget doctorList({
  required Function() onClick,
  ImageProvider? image1,
  String? docname,
  String? docabout,
  String? sessions,
  List<IconData>? rateicons,
  List<Color>? ratcolor,
}) =>
    GestureDetector(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        child: Row(
          children: [
            //profile pic
            CircleAvatar(
              radius: 30.0,
              backgroundImage: image1,
            ),
            const SizedBox(
              width: 20.0,
            ),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //doc name
                  Text(
                    docname!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(
                    width: 6.0,
                  ),

                  //description
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          docabout!,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),

                  // rating
                  Row(
                    children: [
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(

                            top: 11, left: 0.2),
                        child: Row(
                          children: [
                            Icon(
                              rateicons![0],
                              color: ratcolor![0],
                            ),
                            Icon(
                              rateicons[1],
                              color: ratcolor[1],
                            ),
                            Icon(
                              rateicons[2],
                              color: ratcolor[2],
                            ),
                            Icon(
                              rateicons[3],
                              color: ratcolor[3],
                            ),
                            Icon(
                              rateicons[4],
                              color: ratcolor[4],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

Widget sessionData(
        {List<String>? session,
        String? selectedData,
        String? newValue,
        Function(String newValue)? onClick}) =>
    Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 1,
      ),
      child: Material(
        shadowColor: Colors.white,
        elevation: 8.0,
        borderRadius: BorderRadius.circular(30),
        child: DecoratedBox(
          decoration: const ShapeDecoration(
            color: Colors.indigoAccent,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1.0,
                style: BorderStyle.solid,
                color: Colors.indigoAccent,
              ),
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 7.0),
            child: DropdownButton<String>(
              value: selectedData,
              elevation: 10,
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
              ),
              onChanged: onClick!(newValue!),
              underline: const SizedBox(),
              items: session!.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );

/*
String? errorMessage(String hint) {
  switch (hint) {
    case 'الاسم':
      return 'الاسم فارغ';
    case 'الكود':
      return 'الكود فارغ';
    case 'الايميل':
      return 'الايميل فارغ';
    case 'كلمة السر':
      return 'كلمة السر فارغة';
    case 'رقم الهاتف':
      return 'رقم الهاتف فارغ';
    case 'تاريخ الميلاد':
      return 'تاريخ الميلاد فارغ';
    case 'النوع':
      return 'النوع فارغ';
  }
  return null;
}
*/


Widget defaultFormField1({

  required TextEditingController controller,
  required TextInputType type,
  //Function()? onSubmit,
  //Function()? onChange,
  //Function()? onTap,
  bool isPassword = false,
  required Function validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function()? suffixPressed,
  //bool isClickable = true,
}) =>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Material(
        elevation: 8.0,
        borderRadius: BorderRadius.circular(30),
        shadowColor: KSeconedarycolor,
        child: TextFormField(
          cursorColor: KSeconedarycolor,
          obscuringCharacter: '*',
          controller: controller,
          keyboardType: type,
          obscureText: isPassword,
          //enabled: isClickable,
          //onFieldSubmitted: onSubmit!(),
          //onChanged: onChange!(),
          //onTap: onTap,
          //validator: validate(),
          decoration: InputDecoration(
            labelText: label,
            prefixIcon: Icon(
              prefix,
              color: KSeconedarycolor,
            ),
            suffixIcon: suffix != null
                ? IconButton(
                    onPressed: suffixPressed!(),
                    icon: Icon(suffix,color: KSeconedarycolor,),
            ) : null,
            filled: false,
            fillColor: KTherdycolor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: KSeconedarycolor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: KSeconedarycolor),
            ),
            border: const OutlineInputBorder(),
          ),
        ),
      ),
    );



/*Widget customTextField({
  String? hint,
  IconData? icon,
  IconData? icon1,
  Function()? onpress,
  required TextEditingController controle,
  required TextInputType keyboard,
  bool isPassword = false,
  required Function() validate,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Material(
        elevation: 8.0,
        borderRadius: BorderRadius.circular(30),
        shadowColor: KSeconedarycolor,
        // cursorColor: KSeconedarycolor,
        //           obscuringCharacter: '*',
        child: TextFormField(
          controller: controle,
          validator: validate(),
          obscureText: hint == 'Password' ? true : false,
          cursorColor: KSeconedarycolor,
          obscuringCharacter: '*',
          keyboardType: keyboard,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(
              icon,
              color: KSeconedarycolor,
            ),
            suffixIcon: IconButton(
                onPressed: onpress, icon: Icon(icon1, color: KSeconedarycolor)),
            filled: true,
            fillColor: KTherdycolor,
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
    );*/

/*
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChange,
  GestureTapCallback? onTap,
  bool isPassword = false,
  required validate,
  required String label,
  IconData? prefix,
  IconData? suffix,
  Function()? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      minLines: 5,
      maxLines: 10,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: const OutlineInputBorder(),
      ),
    );
 */

Widget dateForm() =>  Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1,),
    child: Material(
      shadowColor: KSeconedarycolor,
      elevation: 8.0,
      borderRadius: BorderRadius.circular(30),
      child: DecoratedBox(
        decoration: const ShapeDecoration(
          color:  Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.0, style: BorderStyle.solid,
                color: KSeconedarycolor),
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 7.0),
    child: DateTimeFormField(
      decoration: const InputDecoration(
        hintStyle: TextStyle(color: Colors.black45),
        errorStyle: TextStyle(color: Colors.redAccent),
        prefixIcon: Icon(
          Icons.event_note,
          color: KSeconedarycolor,
        ),
        filled: true,
        labelText: 'تاريخ ميلادك',
      ),
      mode: DateTimeFieldPickerMode.date,
      autovalidateMode: AutovalidateMode.always,
      validator: (e) =>
          (e?.day ?? 0) == 1 ? 'تاريخ الميلاد غير صحيح' : null,
      onDateSelected: (DateTime value) {
        if (kDebugMode) {
          print(value);}
      },
    ),
    ),
  ),
    ),
);

Widget genderForm({
  String selectedGender = 'النوع',
  List<String> gender = const ['انثي', 'ذكر'],
  required Function() onChange,
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 1,
      ),
      child: Material(
        shadowColor: KSeconedarycolor,
        elevation: 8.0,
        borderRadius: BorderRadius.circular(30),
        child: DecoratedBox(
          decoration: const ShapeDecoration(
            //color: KTherdycolor,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1.0,
                  style: BorderStyle.solid,
                  color: KSeconedarycolor),
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 7.0),
            child: DropdownButton<String>(
              value: selectedGender,
              elevation: 10,
              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
              ),
              onChanged: onChange(),
              underline: const SizedBox(),
              items: gender.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );

Widget customImageField({
  required ImageProvider image,
  double? height,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 30,right: 20,left: 20),
    child: Container(
      padding: const EdgeInsets.only(top: 40),
      child: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image(
              image: image,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildSettingCard({
  required String title,
  required IconData icon,
  required Function() onClick,
}) =>
    GestureDetector(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Material(
          elevation: 5,
          color: KTherdycolor,
          shadowColor: KSeconedarycolor,
          borderRadius: BorderRadius.circular(20),
          clipBehavior: Clip.antiAlias,
          child: Row(
            children: [
              const SizedBox(
                width: 10.0,
              ),
              Icon(
                icon,
                size: 35,
              ),
              const SizedBox(
                width: 15.0,
              ),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios,
              ),
            ],
          ),
        ),
      ),
    );
/*Widget defaultDateFormField({
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged<String>? onSubmit,
  ValueChanged<String>? onChange,
  GestureTapCallback? onTap,
  bool isPassword = false,
  required validate,
  required String label,
  IconData? prefix,
  IconData? suffix,
  Function()? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: const OutlineInputBorder(),
      ),
    );*/
