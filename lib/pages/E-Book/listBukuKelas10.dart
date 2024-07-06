import 'dart:io';

import 'package:flutter/material.dart';
import 'package:school_super_app/pages/E-Book/E-Book.dart';
import 'package:school_super_app/themes/theme.dart';
import 'package:school_super_app/utils/pdf.dart';

class ListBukuKelas10 extends StatefulWidget {
  const ListBukuKelas10({super.key});

  @override
  State<ListBukuKelas10> createState() => _ListBukuKelas10State();
}

class _ListBukuKelas10State extends State<ListBukuKelas10> {

  void openPDF(BuildContext context, File file) => Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => Ebook(file: file)),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          backgroundColor: whiteColor,
          iconTheme: IconThemeData(
            color: Colors.indigo, // Change back button color to indigo
          ),
        ),
        body: SafeArea(
            child: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Mata Pelajaran",
                                style: TextStyle(
                                    color: Colors.indigo,
                                    fontSize: 18,
                                    fontFamily: 'Poppins'),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              // go to e-book
                              final path =
                                  'asset/books/Kelas10_matematika.pdf';
                              final file = await PDF.loadAsset(path);
                              openPDF(context, file);
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor:
                                  Colors.grey[200], // Background color
                              textStyle: TextStyle(
                                  color: Colors.indigo[800]), // Text color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    12), // Button border radius
                              ),
                              elevation: 10, // Button shadow
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.calculate,
                                        size: 30,
                                        color: Colors.red[600],
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Matematika",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.indigo[800],
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Icon(Icons.more_horiz,
                                      color: Colors.indigo[800]),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              // go to e-book
                              final path =
                                  'lib/assets/docs/kelas10_pendidikanPancasila.pdf';
                              final file = await PDF.loadAsset(path);
                              openPDF(context, file);
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor:
                                  Colors.grey[200], // Background color
                              textStyle: TextStyle(
                                  color: Colors.indigo[800]), // Text color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    12), // Button border radius
                              ),
                              elevation: 10, // Button shadow
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.flag,
                                        size: 30,
                                        color: Colors.orange[600],
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Kewarganegaraan",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.indigo[800],
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Icon(Icons.more_horiz,
                                      color: Colors.indigo[800]),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Add your onPressed logic here
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => BukuAgama10()));
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor:
                                  Colors.grey[200], // Background color
                              textStyle: TextStyle(
                                  color: Colors.indigo[800]), // Text color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    12), // Button border radius
                              ),
                              elevation: 10, // Button shadow
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.menu_book_rounded,
                                        size: 30,
                                        color: Colors.green[600],
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Pendidikan Agama",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.indigo[800],
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Icon(Icons.more_horiz,
                                      color: Colors.indigo[800]),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                             onPressed: () async {
                              // go to e-book
                              final path =
                                  'lib/assets/docs/kelas10_b.ing.pdf';
                              final file = await PDF.loadAsset(path);
                              openPDF(context, file);
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor:
                                  Colors.grey[200], // Background color
                              textStyle: TextStyle(
                                  color: Colors.indigo[800]), // Text color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    12), // Button border radius
                              ),
                              elevation: 10, // Button shadow
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.public,
                                        size: 30,
                                        color: Colors.indigo[600],
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Bahasa Inggris",
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.indigo[800],
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Icon(Icons.more_horiz,
                                      color: Colors.indigo[800]),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        )));
  }
}