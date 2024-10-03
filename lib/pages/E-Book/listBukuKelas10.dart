import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_super_app/controllers/buku_controller.dart';
import 'package:school_super_app/pages/E-Book/E-Book.dart';
import 'package:school_super_app/themes/theme.dart';

class ListBukuKelas10 extends StatefulWidget {
  const ListBukuKelas10({super.key});

  @override
  State<ListBukuKelas10> createState() => _ListBukuKelas10State();
}

class _ListBukuKelas10State extends State<ListBukuKelas10> {
  final BukuController bukuController = Get.put(BukuController());

  @override
  void initState() {
    super.initState();
    bukuController.fetchBooks(); // Fetch books when the widget initializes
  }

  void openPDF(BuildContext context, String pdfPath) {
    File file = File(pdfPath); // Create a File object from the pdfPath
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Ebook(file: file), // Pass the File object
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        iconTheme: IconThemeData(
          color: Colors.indigo,
        ),
        title: Text("List of Books"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
          child: Obx(() {
            if (bukuController.isLoading.value) {
              return Center(child: CircularProgressIndicator());
            }
          
            if (bukuController.books.isEmpty) {
              return Center(child: Text("No books available."));
            }
          
            return ListView.builder(
              itemCount: bukuController.books.length,
              itemBuilder: (context, index) {
                final book = bukuController.books[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () => openPDF(context, book['pdf_path']),
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(color: Colors.black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 10,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            book['judul'], // Display the book title
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
