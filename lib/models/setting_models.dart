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
  //1
  SettingsModel(
    'اللغة',
    Icons.language_outlined,
  ),
  //2
  SettingsModel(
    'الخصوصية',
    Icons.security,
  ),
  //3
  SettingsModel(
    'الإشعارات',
    Icons.notifications_none_rounded,
  ),
  //4
  SettingsModel(
    'غير كلمة السر',
    Icons.password_outlined,
  ),
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