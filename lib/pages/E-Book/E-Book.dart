import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';
import 'package:school_super_app/themes/theme.dart';

class Ebook extends StatefulWidget {
  final File file;

  const Ebook({
    Key? key,
    required this.file,
  }) : super(key: key);

  @override
  State<Ebook> createState() => _EbookState();
}

class _EbookState extends State<Ebook> {
  late PDFViewController controller; // Declare controller as late
  int pages = 0;
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file.path);
    final text = '${indexPage + 1} of $pages';

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Text(name),
        backgroundColor: whiteColor,
        iconTheme: IconThemeData(
          color: Colors.indigo, // Change back button color to indigo
        ),
        actions: [
          if (pages >= 2) // Ensure actions is a list of widgets
            Center(child: Text(text)),
          IconButton(
            icon: Icon(Icons.chevron_left, size: 32),
            onPressed: () {
              final page = indexPage == 0 ? pages : indexPage - 1;
              controller.setPage(page);
            },
          ),
          IconButton(
            icon: Icon(Icons.chevron_right, size: 32),
            onPressed: () {
              final page = indexPage == pages - 1 ? 0 : indexPage + 1;
              controller.setPage(page);
            },
          ),
        ],
      ),
      body: PDFView(
        filePath: widget.file.path,
        onRender: (pages) => setState(() => this.pages = pages ?? 0), // Handle nullable integer
        onViewCreated: (controller) =>
            setState(() => this.controller = controller), // Initialize controller
        onPageChanged: (indexPage, _) =>
            setState(() => this.indexPage = indexPage ?? 0), // Handle nullable integer
        // autoSpacing: false,
        swipeHorizontal: true,
      ),
    );
  }
}
