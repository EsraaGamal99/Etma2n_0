import 'package:flutter/material.dart';

class SettingsModel {
  String mtitle;
  IconData micon;
  //String mdescription;

  SettingsModel(
      this.mtitle,
      this.micon,
      );
}

List<SettingsModel> settings = [



  //5
  SettingsModel(
    'مساعدة',
    Icons.help_outline_outlined,
  ),
  //6
  SettingsModel(
    'About Us',
    Icons.new_releases,
  ),
  //7
  SettingsModel(
    'قيم التطبيق',
    Icons.star_rounded,
  ),

];