import 'package:conditional_builder/conditional_builder.dart';
import 'package:etma2n/data/consultation.dart';
import 'package:etma2n/layout/consultation/DoctorAnswerCon.dart';
import 'package:etma2n/layout/consultation/consultationView.dart';
import 'package:etma2n/login/constant/constant.dart';
import 'package:etma2n/todo_list/cubit/cubit.dart';
import 'package:flutter/material.dart';

Color mainColor = const Color(0xffa9c1f7);
Color secondColor = const Color(0xff576dca);

Widget buildTestCart({
  required Function() function,
  String testName = '',
  required String imageLink,
}) =>
    Card(
      clipBehavior: Clip.antiAlias,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Ink.image(
            image: NetworkImage(imageLink),
            child: InkWell(
              onTap: function,
            ),
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                testName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
 // ConUser
Widget buildConsUlItem( context,{
  required String consQ,
  required String conA,
  required String DoctorName,
  required String ImageLink ,
}) => Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              navigateTo(context, ConsView(consQ, conA,ImageLink,DoctorName));
            },
            child: SizedBox(
              height: 150.0,
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      consQ,
                      style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            conA,
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 12.0,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Column(
                          children: [
                            Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: [
                                CircleAvatar(
                                  radius: 11.0,
                                  backgroundImage: NetworkImage(
                                    ImageLink),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 3.0,
                            ),
                            Text(
                              DoctorName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 11.0,
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
          ),
        ],
      ),
    );

/*Widget consBuilder(context,*//*{
  String UserName= 'غير معلن',
  String ImageLink = 'http://www.daar1.com/default_images/profile.png',
}*//*) => ConditionalBuilder(
      condition: consultation.isNotEmpty,
      builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildConsUlItem(
            // هنا يعرض السؤال ولاجابة
            consultation[index].conslQ,
            consultation[index].conslA,
            context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: consultation.length,
      ),
      fallback: (context) => const Center(
          child: CircularProgressIndicator(
        color: Colors.deepPurpleAccent,
      )),
    );*/
//ConDoc
Widget buildConsQlItem(String consQ, context,{
  String UserName= 'غير معلن',
  String ImageLink = 'http://www.daar1.com/default_images/profile.png',
}) => Padding(
  padding: const EdgeInsets.all(18.0),
  child: Column(
    children: [
      InkWell(
        onTap: () {
          navigateTo(context, DoctorAnswerCon(consQ));
        },
        child: SizedBox(
          width: double.infinity,
          height: 100.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  consQ,
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              /*const SizedBox(
                height: 5.0,
              ),*/
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    UserName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 9.0,
                    ),
                  ),
                  const SizedBox(
                    width: 3.0,
                  ),
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      CircleAvatar(
                        radius: 9.0,
                        backgroundImage: NetworkImage(
                           ImageLink),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);
/*Widget consQBuilder(context) => ConditionalBuilder(
  condition: consultation.isNotEmpty,
  builder: (context) => ListView.separated(
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context, index) => buildConsQlItem(
      // هنا يعرض لاجابة
        consultation[index].conslQ,
        context),
    separatorBuilder: (context, index) => myDivider(),
    itemCount: consultation.length,
  ),
  fallback: (context) => const Center(
      child: CircularProgressIndicator(
        color: Colors.deepPurpleAccent,
      )),
);*/

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
        end: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

Widget defaultFormField(
    context,
    {
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
        //hoverColor: Colors.grey,
        labelStyle: Theme.of(context).textTheme.headline6,
        prefixIcon: Icon(
          prefix,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            color: Colors.white38,
          ),
        ),
        //disabledBorder:
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: suffixPressed,
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: OutlineInputBorder(

        ),
      ),
    );

Widget buildTaskItem(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              child: Text(
                '${model['time']}',
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model['title']}',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${model['date']}',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            IconButton(
              onPressed: () {
                ToDoCubit.get(context).updateDB(
                  status: 'done',
                  id: model['id'],
                );
              },
              icon: Icon(
                Icons.check_box,
                color: Colors.green,
              ),
            ),
            IconButton(
              onPressed: () {
                ToDoCubit.get(context).updateDB(
                  status: 'archive',
                  id: model['id'],
                );
              },
              icon: const Icon(
                Icons.archive,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
      onDismissed: (direction) {
        ToDoCubit.get(context).deletDB(
          id: model['id'],
        );
      },
    );

Widget tasksBuilder({
  required List<Map> tasks,
}) =>
    ConditionalBuilder(
      condition: tasks.length > 0,
      builder: (context) => ListView.separated(
        itemBuilder: (context, index) {
          return buildTaskItem(tasks[index], context);
        },
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 20.0,
          ),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        itemCount: tasks.length,
      ),
      fallback: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage('assets/images/noTasks.png'),
              height: 90.0,
              width: 90.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'لا يوجد مهام الان',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );

Widget defaulttaskFormField({
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
    );

/*
late int start;
late int end;
late String StartDate ;
late String EndDate ;

Widget defultAlertDialog({
  required List<String> dates,
  required context,
  required String date,

}) =>
    AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose Date',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 15),
            for (int i = 0; i < dates.length; i++)
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 15.0),
                child: MaterialButton(
                  shape: const StadiumBorder(),
                  color: KButtomcolor,
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    dates[i],
                  ),
                  onPressed: () {
                    if(date == 's'){
                    StartDate = dates[i];
                    dates.remove(StartDate);
                    start=i;
                    }
                    else{
                      EndDate = dates[i];
                      dates.remove(EndDate);
                      end = i;
                    }
                    Navigator.of(context).pop();
                  },
                ),
              ),
          ],
        ),
      ),
    );
*/

Widget buildhomeCart({
  required Function() function,
  String fName = '',
  required String imageLink,
  var height,
  var width,
}) =>
    Card(
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Ink.image(
              image: NetworkImage(imageLink),
              child: InkWell(
                onTap: function,
              ),
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  fName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );





Widget homeCard ({
  required Function() onClick,
  String? FunctionName,
  String? Description,
  required ImageProvider image1,
}) =>
    GestureDetector(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shadowColor: const Color(0xFF5271f0),
          elevation: 3.5,
          //color: Colors.white54,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Container(

            width: double.infinity,
            height: 200,
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //article
                Expanded(
                  child: Column(
                   // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Center(
                        child: Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Image(
                              image: image1,
                             height: 66,
                              width: 66,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0,),
                      Text(
                        FunctionName!,

                        style: const TextStyle(
                          color: KSeconedarycolor,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15.0,),
                      Text(
                        Description!,

                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
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

Widget Buidsch({
  required String day,
  required var OnPress,
  required IconData icon,
}) => Container(
  height: 70.0,
  width: double.infinity,
  padding: const EdgeInsets.all(20),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    gradient: const LinearGradient(
      colors: [Color(0xFF5271ff), Colors.grey],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  child: Stack(
    children: [
      Row(
        children: [
           Text(
            day,
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),

          const Spacer(),
          IconButton(
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            // backgroundColor: Colors.purpleAccent,
        onPressed: OnPress,
          ),
        ],
      ),
    ],
  ),
);