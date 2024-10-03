import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:school_super_app/config/config.dart';
import 'package:school_super_app/pages/E-Book/E-Book.dart';

class BukuController extends GetxController {
  RxList<dynamic> books = <dynamic>[].obs; // Store the list of books
  RxBool isLoading = true.obs;

  // Fetch books from the API
  Future<void> fetchBooks() async {
    final url = Config().urlBook; // Use the URL from the config
    try {
      isLoading.value = true; // Start loading
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Decode JSON response and update the books list
        books.value = json.decode(response.body);
      } else {
        // Handle errors here
        print("Error fetching books: ${response.body}");
      }
    } catch (e) {
      print("Error: $e"); // Print the error for debugging
    } finally {
      isLoading.value = false; // End loading
    }
  }

  // Download and save PDF locally
  Future<File> downloadPDF(String pdfUrl) async {
    try {
      // Fetch the PDF from the URL
      final response = await http.get(Uri.parse(pdfUrl));
      if (response.statusCode == 200) {
        // Get the path to store the file
        final directory = await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/temp.pdf';

        // Write the file to the local path
        final file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);

        return file;
      } else {
        throw Exception('Failed to download PDF');
      }
    } catch (e) {
      print('Error downloading PDF: $e');
      rethrow;
    }
  }

  // Open the PDF file
  void openPDF(BuildContext context, String pdfPath) async {
    final fullPdfUrl = Config.urlMain + pdfPath; // Construct the full URL

    try {
      // Download the PDF file
      final file = await downloadPDF(fullPdfUrl);

      // Open the Ebook viewer with the downloaded file
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Ebook(file: file),
        ),
      );
    } catch (e) {
      print('Error opening PDF: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to open the book')),
      );
    }
  }
}
