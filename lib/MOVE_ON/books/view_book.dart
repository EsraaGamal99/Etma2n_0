import 'dart:io';
import 'package:etma2n/MOVE_ON/models/books_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import 'package:path/path.dart';

class BookViewerPage extends StatefulWidget {
  final File file;
  final int bookindex;

  const BookViewerPage({ required this.file, required this.bookindex});

  @override
  _BookViewerPageState createState() => _BookViewerPageState();
}

class _BookViewerPageState extends State<BookViewerPage> {
  late PDFViewController controller;
  int pages = 0;
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    //final name = basename(widget.file.path);
    final text = '$pages / ${indexPage + 1}';

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF5271ff),
          title: Center(
            child: Text(
              book[widget.bookindex].bkname,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          actions: pages >= 1
              ? [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Center(
                        child: Text(
                      text,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                  ),
                  /*  IconButton(
              icon: Icon(Icons.chevron_left, size: 35),
              onPressed: () {
                final page = indexPage == 0 ? pages : indexPage - 1;
                controller.setPage(page);
              },
            ),
            IconButton(
              icon: Icon(Icons.chevron_right, size: 35),
              onPressed: () {
                final page = indexPage == pages - 1 ? 0 : indexPage + 1;
                controller.setPage(page);
              },
            ),*/
                ]
              : null,
        ),
        body: PDFView(
          filePath: widget.file.path,
          autoSpacing: true,
          swipeHorizontal: true,
          pageSnap: true,
          pageFling: true,
          onRender: (pages) => setState(() => this.pages = pages!),
          onViewCreated: (controller) =>
              setState(() => this.controller = controller),
          onPageChanged: (indexPage, _) =>
              setState(() => this.indexPage = indexPage!),
        ),
      ),
    );
  }
}
