import 'package:etma2n/MOVE_ON/books/api_books.dart';
import 'package:etma2n/MOVE_ON/models/books_models.dart';
import 'package:etma2n/MOVE_ON/widgets/customelist_books.dart';
import 'package:etma2n/MOVE_ON/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'view_book.dart';


class BooksMainPage extends StatefulWidget {
  static String id = 'BooksMainPage';

  @override
  _BooksMainPageState createState() => _BooksMainPageState();
}

class _BooksMainPageState extends State<BooksMainPage> {
  Color? color1;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
         // backgroundColor: Color(0xFF5271ff),
          title: Center(
            child: Text(
              'كتب',
              style: TextStyle(
               // color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.menu,
              ),
              onPressed: () {
                onPrint();
              },
             // color: Colors.white,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //search row
                GestureDetector(
                  onTap: onPrint,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.white, Colors.grey],
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                      ),
                      borderRadius: BorderRadius.circular(
                        15.0,
                      ),
                    ),
                    padding: EdgeInsets.all(
                      8.0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.search,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          '  بحث  ',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),

                // list of books
                CustomListOfBooks(
                  title: book[0].bkname,
                  image1: AssetImage(book[0].bkimage),
                  writer: book[0].bkwriter,
                  description: book[0].bkdescription,
                  onClick: () async {
                    //print("ops!!!!!!!!!!!!!!!!!!!");
                    final bookindex = 0;
                    final url = 'books_pdf/book1.pdf';
                    final file = await BookApi.loadAsset(url);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              BookViewerPage(file: file, bookindex: bookindex)),
                    );
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                myLine(color1= Color(0XFFD6D6D6)),
                SizedBox(
                  height: 15.0,
                ),

                CustomListOfBooks(
                  title: book[0].bkname,
                  image1: AssetImage(book[0].bkimage),
                  writer: book[0].bkwriter,
                  description: book[0].bkdescription,
                  onClick: () async {
                    //print("ops!!!!!!!!!!!!!!!!!!!");
                    final bookindex = 4;
                    final url = 'books_pdf/book1.pdf';
                    final file = await BookApi.loadAsset(url);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              BookViewerPage(file: file, bookindex: bookindex)),
                    );
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                myLine(color1= Color(0XFFD6D6D6)),
                SizedBox(
                  height: 15.0,
                ),

                CustomListOfBooks(
                  title: book[1].bkname,
                  image1: AssetImage(book[1].bkimage),
                  writer: book[1].bkwriter,
                  description: book[1].bkdescription,
                  onClick: () async {
                    //print("ops!!!!!!!!!!!!!!!!!!!");
                    final bookindex = 1;
                    final url = 'books_pdf/book2.pdf';
                    final file = await BookApi.loadAsset(url);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              BookViewerPage(file: file, bookindex: bookindex)),
                    );
                  },
                ),
                SizedBox(height: 15.0,),
                myLine(color1= Color(0XFFD6D6D6)),
                SizedBox(
                  height: 15.0,
                ),

                CustomListOfBooks(
                  title: book[2].bkname,
                  image1: AssetImage(book[2].bkimage),
                  writer: book[2].bkwriter,
                  description: book[2].bkdescription,
                  onClick: () async {
                    //print("ops!!!!!!!!!!!!!!!!!!!");
                    final bookindex = 0;
                    final url =
                        'https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf';
                    final file = await BookApi.loadNetwork(url);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              BookViewerPage(file: file, bookindex: bookindex)),
                    );
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                myLine(color1=Color(0XFFD6D6D6)),
                SizedBox(
                  height: 15.0,
                ),

                CustomListOfBooks(
                  title: book[3].bkname,
                  image1: AssetImage(book[3].bkimage),
                  writer: book[3].bkwriter,
                  description: book[3].bkdescription,
                  onClick: () async {
                    //print("ops!!!!!!!!!!!!!!!!!!!");
                    final bookindex = 3;
                    final url = 'books_pdf/sample.pdf';
                    final file = await BookApi.loadAsset(url);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              BookViewerPage(file: file, bookindex: bookindex)),
                    );
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                myLine(color1=Color(0XFFD6D6D6)),
                SizedBox(
                  height: 15.0,
                ),

                CustomListOfBooks(
                  title: book[4].bkname,
                  image1: AssetImage(book[4].bkimage),
                  writer: book[4].bkwriter,
                  description: book[4].bkdescription,
                  onClick: () async {
                    //print("ops!!!!!!!!!!!!!!!!!!!");
                    final bookindex = 2;
                    final url = 'books_pdf/sample.pdf';
                    final file = await BookApi.loadAsset(url);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              BookViewerPage(file: file, bookindex: bookindex)),
                    );
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                myLine(color1=Color(0XFFD6D6D6)),
                SizedBox(
                  height: 15.0,
                ),

                CustomListOfBooks(
                  title: book[0].bkname,
                  image1: AssetImage(book[0].bkimage),
                  writer: book[0].bkwriter,
                  description: book[0].bkdescription,
                  onClick: () async {
                    //print("ops!!!!!!!!!!!!!!!!!!!");
                    final bookindex = 0;
                    final url =
                        'https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf';
                    final file = await BookApi.loadNetwork(url);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              BookViewerPage(file: file, bookindex: bookindex)),
                    );
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                myLine(color1=Color(0XFFD6D6D6)),
                SizedBox(
                  height: 15.0,
                ),

                CustomListOfBooks(
                  title: book[1].bkname,
                  image1: AssetImage(book[1].bkimage),
                  writer: book[1].bkwriter,
                  description: book[1].bkdescription,
                  onClick: () async {
                    //print("ops!!!!!!!!!!!!!!!!!!!");
                    final bookindex = 1;
                    final url = 'books_pdf/book1.pdf';
                    final file = await BookApi.loadAsset(url);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              BookViewerPage(file: file, bookindex: bookindex)),
                    );
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                myLine(color1=Color(0XFFD6D6D6)),
                SizedBox(
                  height: 15.0,
                ),

                CustomListOfBooks(
                  title: book[2].bkname,
                  image1: AssetImage(book[2].bkimage),
                  writer: book[2].bkwriter,
                  description: book[2].bkdescription,
                  onClick: () async {
                    //print("ops!!!!!!!!!!!!!!!!!!!");
                    final bookindex = 2;
                    final url = 'books_pdf/sample.pdf';
                    final file = await BookApi.loadAsset(url);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              BookViewerPage(file: file, bookindex: bookindex)),
                    );
                  },
                ),
                SizedBox(height: 15.0,),
                myLine(color1=Color(0XFFD6D6D6)),
                SizedBox(height: 15.0,),

                CustomListOfBooks(
                  title: book[3].bkname,
                  image1: AssetImage(book[3].bkimage),
                  writer: book[3].bkwriter,
                  description: book[3].bkdescription,
                  onClick: () async {
                    //print("ops!!!!!!!!!!!!!!!!!!!");
                    final bookindex = 3;
                    final url = 'books_pdf/book1.pdf';
                    final file = await BookApi.loadAsset(url);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              BookViewerPage(file: file, bookindex: bookindex)),
                    );
                  },
                ),
                SizedBox(height: 15.0,),
                myLine(color1=Color(0XFFD6D6D6)),
                SizedBox(
                  height: 15.0,
                ),

                CustomListOfBooks(
                  title: book[4].bkname,
                  image1: AssetImage(book[4].bkimage),
                  writer: book[4].bkwriter,
                  description: book[4].bkdescription,
                  onClick: () async {
                    //print("ops!!!!!!!!!!!!!!!!!!!");
                    final bookindex = 4;
                    final url = 'books_pdf/sample.pdf';
                    final file = await BookApi.loadAsset(url);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              BookViewerPage(file: file, bookindex: bookindex)),
                    );
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                myLine(color1=Color(0XFFD6D6D6)),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

onPrint() => print("printed");

/*
void openPDF(BuildContext context, File file) => Navigator.of(context).push(
  MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),);
*/

/*
ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => CustomListOfBooks(
                    image1: AssetImage('images/img.jpg'),
                    onClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PdfViewPage(path: assetPDFPath),
                        ),
                      );},
                  ),

                  separatorBuilder: (context, index) => SizedBox (height: 20.0,),
                  itemCount: 5,
                ),
 */

/*

@override
  void initState() {
    super.initState();
    getFileFromAsset("/book1.pdf").then((f) {
      setState(() {
        assetPDFPath = f.path;
        print(assetPDFPath);
      });
    });
  }

  Future<File> getFileFromAsset(String asset) async {
    try {
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/book1.pdf");

      File assetFile = await file.writeAsBytes(bytes);
      return assetFile;
    } catch (e) {
      throw Exception("Error opening asset file");
    }
  }

 */
