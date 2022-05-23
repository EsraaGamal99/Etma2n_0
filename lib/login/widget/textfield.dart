
import 'package:etma2n/login/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hint;
  final IconData ?icon;
  final FormFieldSetter<String>? onClick;
  final IconData? icon1;
  final Function() ?onPressed;

  String? errorMessage(String str){
    switch(hint)
    {
      case 'الاسم': return 'الاسم فارغ';
      case 'الايميل': return 'الايميل فارغ';
      case 'كلمة السر': return 'كلمة السر فارغة';
      case 'رقم الهاتف': return 'رقم الهاتف فارغ';
     // case 'Password': return 'Password is empty';

    }
  }

  CustomTextField({ this.onClick, this.icon,required this.hint,this.icon1,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return
      Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Material(
        elevation: 8.0,
        borderRadius: BorderRadius.circular(30),
        shadowColor: KSeconedarycolor,
        child: TextFormField(
          validator: (value){if(value!.isEmpty) {
              return errorMessage(hint!);
            }},
          onSaved: onClick,
          obscureText: hint=='Password'? true:false,
          cursorColor: KSeconedarycolor,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(
              icon,
              color: KSeconedarycolor,
            ),
            suffixIcon: IconButton(
              icon: Icon( icon1,
              color: KSeconedarycolor
              ),
              onPressed: onPressed,
            ),
            filled: true,
            fillColor: KTherdycolor,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: KSeconedarycolor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: KSeconedarycolor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: KSeconedarycolor),
            ),
          ),
        ),
      ),
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<IconData>('icon1', icon1));
  }
}