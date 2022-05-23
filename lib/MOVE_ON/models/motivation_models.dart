import 'package:flutter/material.dart';

List<MotivationsModel> motivation = [
  //0
  MotivationsModel(6, 'حب الذات', '6 جلسات', 'images/motivations/moty1.jpg',
      Color(0XFFBCAAA4) , 'تعلم تقدير ذاتك وحبها من خلال ألبوم حب الذات', [
    'الجلسه الاولي - المقدمة',
    'الجلسه الثانية',
    'الجلسه الثالثة',
    'الجلسه الرابعه',
    'الجلسه الخامسة',
    'الجلسه السادسة'
  ]),

  //1
  MotivationsModel(
      6,
      'التعامل مع الأرق',
      '6 جلسات',
      'assets/images/moty2.jpg',
      Color(0XFF607D8B),
      'تعلم تقدير ذاتك وحبها من خلال ألبوم الأرق ', [
    'الجلسه الاولي - المقدمة',
    'الجلسه الثانية',
    'الجلسه الثالثة',
    'الجلسه الرابعه',
    'الجلسه الخامسة',
    'الجلسه السادسة'
  ]),

  //2
  MotivationsModel(
      6,
      'التعامل مع القلق والتوتر',
      '6 جلسات',
      'assets/images/moty3.jpg',
      Color(0XFF37474F),
      'تعلم تقدير ذاتك وحبها من ألبوم القلق والتوتر', [
    'الجلسه الاولي - المقدمة',
    'الجلسه الثانية',
    'الجلسه الثالثة',
    'الجلسه الرابعه',
    'الجلسه الخامسة',
    'الجلسه السادسة'
  ]),

  //3
  MotivationsModel(
      6,
      'التعامل مع الضغط',
      '6 جلسات',
      'assets/images/moty4.jpg',
      Color(0XFFB39DDB),
      'تعلم تقدير ذاتك وحبها من ألبوم الضغط', [
    'الجلسه الاولي - المقدمة',
    'الجلسه الثانية',
    'الجلسه الثالثة',
    'الجلسه الرابعه',
    'الجلسه الخامسة',
    'الجلسه السادسة'
  ]),

//4
  MotivationsModel(6, 'الإمتنان', '6 جلسات', 'assets/images/moty5.jpg',
      Color(0XFF9FA8DA), 'تعلم تقدير ذاتك وحبها من ألبوم الإمتنان  '
          , [
    'الجلسه الاولي - المقدمة',
    'الجلسه الثانية',
    'الجلسه الثالثة',
    'الجلسه الرابعه',
    'الجلسه الخامسة',
    'الجلسه السادسة'
  ]),
//5
  MotivationsModel(
      6,
      'التعامل مع الاكتئاب',
      '6 جلسات',
      'assets/images/moty6.jpg',
      Color(0XFF5D4037),
      'تعلم تقدير ذاتك وحبها من ألبوم الاكتئاب ',
      [
    'الجلسه الاولي - المقدمة',
    'الجلسه الثانية',
    'الجلسه الثالثة',
    'الجلسه الرابعه',
    'الجلسه الخامسة',
    'الجلسه السادسة'
  ]),
];

class MotivationsModel {
  int motnum_sessions;
  String motname;
  String motsession;
  String motbackimage;
  Color motbackcolor;
  //String moticon;
  String motdiscripation;
  List motsessions_discription;

  MotivationsModel(
      this.motnum_sessions,
      this.motname,
      this.motsession,
      this.motbackimage,
      this.motbackcolor,
      this.motdiscripation,
      this.motsessions_discription);
}
