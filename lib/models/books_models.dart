List <BooksModel> book = [

  //1
  BooksModel('لا بطعم الفلامنكو',
    'assets/images/imgbook1.jpg',
    "كتاب عن الصحه النفسيه لدكتور محمد طه واحد من اهم واكبر الدكاتر النفسيين ف مصر",
  'د . محمد طه','books_pdf/book1.pdf',),

  //2
  BooksModel(
    'كتاب الصحة النفسية للجميع',
    'assets/images/imgbook2.jpg',
    "كتاب عن الصحه النفسيه لدكتور فيكرام باتيل واحد من اهم واكبر الدكاتر النفسيين ف مصر",
    'د. فيكرام باتيل','books_pdf/book2.pdf'
  ),

  //3
  BooksModel(
    'الجنون في غياهب السجون',
    'assets/images/imgbook4.jpg',
    'أزمة الصحة العقلية خلف القضبان ودورنا في مواجهتها',
    'تريي كوبرز','books_pdf/sample.pdf'
  ),

  //4
  BooksModel(
    'تنشئة الأطفال في القرن الحادي والعشرين',
    'assets/images/imgbook4.jpg',
    "كتاب عن الصحه النفسيه لدكتور شارون كيه هو واحد من اهم واكبر الدكاتر النفسيين ف مصر",
    'شارون كيه هول','assets/books_pdf/sample.pdf'
  ),

  //5
  BooksModel(
    'من انت من أنا من هو',
    'assets/images/imgbook6.jpg',
    "كتاب عن الصحه النفسيه لدكتور فيكرام باتيل واحد من اهم واكبر الدكاتر النفسيين ف مصر",
    'د. عادل صادق ','assets/books_pdf/sample.pdf'
  ),

//  BooksModel(),
];

class BooksModel {
  String bkname;
  String bkimage;
  String bkdescription;
  String bkwriter;
  String bkpath;

  BooksModel(this.bkname,this.bkimage,this.bkdescription,this.bkwriter,this.bkpath);
}