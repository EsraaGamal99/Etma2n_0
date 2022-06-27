import 'package:flutter/material.dart';

class MotivationsModel {
  int motnum_sessions;
  String motname;
  String motsession;
  String motbackimage;
  Color motbackcolor;
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

List<MotivationsModel> motivation = [

  //0
  MotivationsModel(
      7,
      'حب الذات',
      '6 جلسات',
      'assets/images/moty1.jpg',
      Colors.brown[200]!,
      'تعلم تقدير ذاتك وحبها من خلال ألبوم حب الذات', [
    'الجلسه الاولي - المقدمة',
    'الجلسه الثانية',
    'الجلسه الثالثة',
    'الجلسه الرابعه',
    'الجلسه الخامسة',
    'الجلسه السادسة',
    'الجلسه السابعة',
  ]),

  //1
  MotivationsModel(
      7,
      'التعامل مع الأرق',
      '6 جلسات',
      'assets/images/moty2.jpg',
      Colors.blueGrey[500]!,
      'تعلم تقدير ذاتك وحبها من خلال ألبوم الأرق ', [
    'الجلسه الاولي - المقدمة',
    'الجلسه الثانية',
    'الجلسه الثالثة',
    'الجلسه الرابعه',
    'الجلسه الخامسة',
    'الجلسه السادسة',
    'الجلسه السابعة',
  ]),

  //2
  MotivationsModel(
      7,
      'التعامل مع القلق والتوتر',
      '6 جلسات',
      'assets/images/moty3.jpg',
      Colors.blueGrey[800]!,
      'تعلم تقدير ذاتك وحبها من ألبوم القلق والتوتر', [
    'الجلسه الاولي - المقدمة',
    'الجلسه الثانية',
    'الجلسه الثالثة',
    'الجلسه الرابعه',
    'الجلسه الخامسة',
    'الجلسه السادسة',
    'الجلسه السابعة',
  ]),

  //3
  MotivationsModel(
      7,
      'التعامل مع الضغط',
      '6 جلسات',
      'assets/images/moty4.jpg',
      Colors.deepPurple[200]!,
      'تعلم تقدير ذاتك وحبها من ألبوم الضغط', [
    'الجلسه الاولي - المقدمة',
    'الجلسه الثانية',
    'الجلسه الثالثة',
    'الجلسه الرابعه',
    'الجلسه الخامسة',
    'الجلسه السادسة',
    'الجلسه السابعة',
  ]),

  //4
  MotivationsModel(
      7,
      'الإمتنان',
      '6 جلسات',
      'assets/images/moty5.jpg',
      Colors.indigo[200]!,
      'تعلم تقدير ذاتك وحبها من ألبوم الإمتنان  ', [
    'الجلسه الاولي - المقدمة',
    'الجلسه الثانية',
    'الجلسه الثالثة',
    'الجلسه الرابعه',
    'الجلسه الخامسة',
    'الجلسه السادسة',
    'الجلسه السابعة',
  ]),

  //5
  MotivationsModel(
      7,
      'التعامل مع الاكتئاب',
      '6 جلسات',
      'assets/images/moty6.jpg',
      Colors.brown[700]!,
      'تعلم تقدير ذاتك وحبها من ألبوم الاكتئاب ', [
    'الجلسه الاولي - المقدمة',
    'الجلسه الثانية',
    'الجلسه الثالثة',
    'الجلسه الرابعه',
    'الجلسه الخامسة',
    'الجلسه السادسة',
    'الجلسه السابعة',
  ]),
];



// SESSION

class SessionModel {
  String sespath;
  String sestitle;

  SessionModel(this.sespath, this.sestitle);
}

List<SessionModel> session = [

  //1
  SessionModel('https://youtu.be/V00-Roort6o','الجلسه الاولي - المقدمة'),

  //2
  SessionModel('moty_mp3/mot2.mp3', 'الجلسة الثانية'),

  //3
  SessionModel('moty_mp3/mot3.mp3', 'الجلسة الثالثة'),

  //4
  SessionModel('moty_mp3/mot1.mp3', 'الجلسة الرابعة'),

  //5
  SessionModel('moty_mp3/mot2.mp3', 'الجلسة الخامسة'),

  //6
  SessionModel('moty_mp3/mot3.mp3', 'الجلسة السادسة'),

  //7
  SessionModel('moty_mp3/mot1.mp3', 'الجلسة السابعة'),

];
