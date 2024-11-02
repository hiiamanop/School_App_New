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
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file.path);
    final text = '${indexPage + 1} of $pages';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Text(name),
        actions: [
          if (pages >= 2 && !isError) 
            Center(child: Text(text)),
          if (!isError) ...[
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
        ],
      ),
      body: isError 
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error, color: Colors.red, size: 60),
                  SizedBox(height: 16),
                  Text(
                    'Failed to load the PDF file',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => setState(() {
                      isError = false;
                    }),  // Retry button, resets error state
                    child: Text('Retry'),
                  ),
                ],
              ),
            )
          : PDFView(
              filePath: widget.file.path,
              onRender: (pages) => setState(() => this.pages = pages ?? 0),
              onViewCreated: (controller) => setState(() {
                this.controller = controller;
                controller.setPage(indexPage); // Set initial page to the current index
              }),
              onPageChanged: (indexPage, _) => setState(() => this.indexPage = indexPage ?? 0),
              swipeHorizontal: true,
              onError: (error) {
                print(error.toString());
                setState(() {
                  isError = true;  // If an error occurs, set the error flag
                });
              },
              onPageError: (page, error) {
                print('Error on page $page: $error');
                setState(() {
                  isError = true;  // Handle page-specific error
                });
              },
            ),
    );
  }
}
