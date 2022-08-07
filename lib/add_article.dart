import 'package:audioplayers/audioplayers.dart';
import 'package:etma2n/Settings/main_setting_page.dart';
import 'package:etma2n/articles_page_doctor.dart';
import 'package:etma2n/models/article_models.dart';
import 'package:etma2n/models/doctors_model.dart';
import 'package:etma2n/shared/component/components.dart';
import 'package:flutter/material.dart';

import '../../shared/styles/colors.dart';

class AddArticle extends StatelessWidget{

  static List<String> articles = [];
  static List<String> docnames = [];
  //static List<String> docpic = [];
  static List<String> title = [];
  static List<String> time = [];
/*
       article[article.length+1].artcontant=art;
                  article[article.length+1].writername=docname;
                  article[article.length+1].arttitle= arttitle;
                  article[article.length+1].writerimage= doctor[5].docpic;
                  article[article.length+1].arttime= DateTime.now() as String;
 */

  @override
  Widget build(BuildContext context) {
    var newarticleController = TextEditingController();
    var nameController = TextEditingController();
    var titlearticleCon = TextEditingController();
    Color mainColor = const Color(0xffa9c1f7);
    Color secondColor = const Color(0xff576dca);
    String art=newarticleController.text;
    String docname = nameController.text;
    String arttitle = titlearticleCon.text;


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

                        defaulttaskFormField(
                          controller: nameController,
                          type: TextInputType.name,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return "الاسم فارغ";
                            }
                            return null;
                          },
                          label: 'الاسم',
                        ),

                        const SizedBox(height: 15,),
                        defaulttaskFormField(
                          controller: titlearticleCon,
                          type: TextInputType.text,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return "العنوان فارغ";
                            }
                            return null;
                          },
                          label: 'عنوان المقال الجديد',
                        ),

                        const SizedBox(height: 20,),

                        defaultFormField(
                          context,
                          controller: newarticleController,
                          type: TextInputType.text,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return "المقال فارغ";
                            }
                            return null;
                          },
                          label: 'اكتب المقال الجديد',
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              MaterialButton(
                shape: const StadiumBorder(),
                color: KSeconedarycolor,
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                onPressed: () {


                  articles.add(newarticleController.text);
                  docnames.add(nameController.text);
                  title.add(titlearticleCon.text);
                  //for (int i=0;i<doctor.length;i++){
                    //docpic.add(doctor[i].docpic);}
                  time.add(DateTime.now().month.toString());
                  navigatePOp(context,  ArticlesDoctor(title:AddArticle.title, docnames: AddArticle.docnames, articles:AddArticle.docnames, time: AddArticle.time,));
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