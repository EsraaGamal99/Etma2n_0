import 'package:etma2n/widgets/components.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/constant.dart';

class EditProfile extends StatefulWidget{
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();

  late PickedFile imageFile;
  final ImagePicker _picker = ImagePicker();

  void takePhoto(ImageSource source) async
  {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      imageFile = pickedFile!;
    });
  }


  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1.0,
          backgroundColor: Colors.white, //const Color(0xFF5271ff),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: KSeconedarycolor,
          ),
          title: const Text(
            'الملف الشخصي',
            style: TextStyle(
              color: KSeconedarycolor, //Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            IconButton(
                onPressed:() {
                  //update data
                  Navigator.of(context).pop();
                } ,
                icon: const Icon(Icons.done_rounded ,color: KSeconedarycolor,),
            ),
          ],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children:  [

              const SizedBox(height: 50,),

              //user pic
              Container(
                decoration:  const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 15,
                        color: KSeconedarycolor,
                        spreadRadius: 5),
                  ],
                ),
                child:  const CircleAvatar(
                  radius: 100.0,
                  backgroundImage: //imageFile == Null?
                  AssetImage("assets/images/articles/art1.jpg"),
                 // FileImage((File(imageFile.path))),
                ),
              ),


              Container(
                padding: const EdgeInsets.only(top: 8),
                child: Center(
                  child: TextButton(
                    onPressed: (){
                      showModalBottomSheet(context: context, builder:( (builder) => bottomSheet()));
                    },
                    child: const Text(
                      'تغيير الصورة',
                      style: TextStyle(fontSize: 15, color: KSeconedarycolor,fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 33,),

              //username
              defaultFormField1(
                  controller: namecontroller,
                  type: TextInputType.emailAddress,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'الاسم فارغ';
                    }
                    return null;
                  },
                  label: 'الاسم',
                  prefix: Icons.person_outline_outlined),

              const SizedBox(height: 25,),

              defaultFormField1(
                  controller: emailcontroller,
                  type: TextInputType.emailAddress,
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'البريد فارغ';
                    }
                    return null;
                  },
                  label: 'البريد',
                  prefix: Icons.email_outlined),

            ],
          ),
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal:20 ,vertical: 20),
      child: Column(
        children:  [
          const Text('select profile pic',style: TextStyle(fontSize: 20),),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('Camera'),
              ),
              FlatButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                icon: const Icon(Icons.photo),
                label: const Text('Gallery'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}