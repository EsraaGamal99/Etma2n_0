List <BooksModel> book = [

  //1
  BooksModel('لا بطعم الفلامنكو',
    'https://www.arab-books.com/wp-content/uploads/2020/04/%D9%84%D8%A3-%D8%A8%D8%B7%D8%B9%D9%85-%D8%A7%D9%84%D9%81%D9%84%D8%A7%D9%85%D9%86%D9%83%D9%88-PDF.jpg',
    "كتاب عن الصحه النفسيه لدكتور محمد طه واحد من اهم واكبر الدكاتر النفسيين ف مصر",
  'د . محمد طه','books_pdf/book1.pdf',),

  //2
  BooksModel(
    'كتاب الصحة النفسية للجميع',
    'https://www.noor-book.com/publice/covers_cache_webp/13/8/7/7/07f8b2c19a8770def652fb77ac3bb1e4.png.webp',
    "كتاب عن الصحه النفسيه لدكتور فيكرام باتيل واحد من اهم واكبر الدكاتر النفسيين ف مصر",
    'د. فيكرام باتيل','assets/books_pdf/book2.pdf'
  ),

  //3
  BooksModel(
    'الجنون في غياهب السجون',
    'https://www.noor-book.com/publice/covers_cache_jpg/6/2/2/0/58c615f98d220e87b8cf2af18366b289.png.jpg',
    'أزمة الصحة العقلية خلف القضبان ودورنا في مواجهتها',
    'تريي كوبرز','assets/books_pdf/sample.pdf'
  ),

  //4
  BooksModel(
    'تنشئة الأطفال في القرن الحادي والعشرين',
    'https://watanbooks.com/wp-content/uploads/2018/09/366x500.jpg',
    "كتاب عن الصحه النفسيه لدكتور شارون كيه هو واحد من اهم واكبر الدكاتر النفسيين ف مصر",
    'شارون كيه هول','assets/books_pdf/sample.pdf'
  ),

  //5
  BooksModel(
    'من انت من أنا من هو',
    'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1302008996l/11006984.jpg',
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