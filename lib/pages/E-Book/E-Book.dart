import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';
import 'package:school_super_app/themes/theme.dart';

class Ebook extends StatefulWidget {
  final File file;

  const Ebook({Key? key, required this.file}) : super(key: key);

  @override
  State<Ebook> createState() => _EbookState();
}

class _EbookState extends State<Ebook> {
  late PDFViewController controller;
  int pages = 0;
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file.path);
    final text = '${indexPage + 1} of $pages';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Text(name),
        actions: [
          if (pages >= 2) 
            Center(child: Text(text)),
          IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              if (indexPage > 0) {
                final page = indexPage - 1;
                controller.setPage(page);
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.chevron_right),
            onPressed: () {
              if (indexPage < pages - 1) {
                final page = indexPage + 1;
                controller.setPage(page);
              }
            },
          ),
        ],
      ),
      body: PDFView(
        filePath: widget.file.path,
        onRender: (pages) => setState(() => this.pages = pages ?? 0),
        onViewCreated: (controller) => setState(() {
          this.controller = controller;
          controller.setPage(indexPage); // Set initial page to the current index
        }),
        onPageChanged: (indexPage, _) => setState(() => this.indexPage = indexPage ?? 0),
        swipeHorizontal: true,
      ),
    );
  }
}
