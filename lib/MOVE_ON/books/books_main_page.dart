import 'package:etma2n/shared/component/components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../Settings/main_setting_page.dart';
import '../../models/books_models.dart';
import '../../widgets/components.dart';
import 'api_books.dart';
import 'view_book.dart';

class BooksMainPage extends StatefulWidget {
  static String id = 'BooksMainPage';

  const BooksMainPage({Key? key}) : super(key: key);

  @override
  _BooksMainPageState createState() => _BooksMainPageState();
}

class _BooksMainPageState extends State<BooksMainPage> {
  late Color color1;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'كتب',
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.menu,
              ),
              onPressed: () {
                navigateTo(context, const SettingScreen());
              },
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
/*
                GestureDetector(
                  onTap: () {
                    if (kDebugMode) {
                      print('search opened');
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.white, Colors.grey],
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                      ),
                      borderRadius: BorderRadius.circular(
                        15.0,
                      ),
                    ),
                    padding: const EdgeInsets.all(
                      8.0,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
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
                const SizedBox(
                  height: 30.0,
                ),
*/

                // list of books
                ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => booksCard(
                    onClick: () async {
                      final url = book[index].bkpath;
                      final file = await BookApi.loadAsset(url);
                      navigateTo (context,BookViewerPage
                        (file: file, bookindex: index));
                      },
                    /*  Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) =>
                                BookViewerPage(file: file, bookindex: index)),)
                      ;},*/
                    image1: NetworkImage(book[index].bkimage),
                    title: book[index].bkname,
                    description: book[index].bkdescription,
                    writer: book[index].bkwriter,
                  ),
                  separatorBuilder: (context, index) =>
                      myLine(Colors.grey[350]!),
                  itemCount: book.length,
                ),
                //booksBuilder(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
