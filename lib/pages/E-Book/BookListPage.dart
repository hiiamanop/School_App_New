import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:school_super_app/model/Buku_model.dart';
import 'package:school_super_app/pages/E-Book/E-Book.dart';
import 'package:school_super_app/services/BukuServices.dart';
import 'package:path_provider/path_provider.dart';

class BookListPage extends StatefulWidget {
  @override
  _BookListPageState createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  late Future<List<BukuModel>> futureBooks;
  int selectedCategory = 1; // Default to category "Buku Kelas 10"

  @override
  void initState() {
    super.initState();
    futureBooks = BookService().fetchBooksByCategory(selectedCategory);
  }

  void fetchBooks(int category) {
    setState(() {
      futureBooks = BookService().fetchBooksByCategory(category);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Books by Category'),
      ),
      body: Column(
        children: [
          // Category Buttons
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => fetchBooks(1), // Buku Kelas 10
                  child: Text('Buku Kelas 10'),
                ),
                ElevatedButton(
                  onPressed: () => fetchBooks(2), // Buku Kelas 11
                  child: Text('Buku Kelas 11'),
                ),
                ElevatedButton(
                  onPressed: () => fetchBooks(3), // Buku Kelas 12
                  child: Text('Buku Kelas 12'),
                ),
                ElevatedButton(
                  onPressed: () => fetchBooks(4), // Lainnya
                  child: Text('Lainnya'),
                ),
              ],
            ),
          ),
          // Display Book List
          Expanded(
            child: FutureBuilder<List<BukuModel>>(
              future: futureBooks,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text("No books available"));
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final book = snapshot.data![index];
                      return ListTile(
                        title: Text(book.judul),
                        onTap: () async {
                          final file = await downloadFile(
                              book.pdf_path, '${book.judul}.pdf');
                          // Implement this
                          if (file != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Ebook(file: file),
                              ),
                            );
                          }
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Download function to fetch PDF and store it locally
Future<File> downloadFile(String url, String filename) async {
  try {
    // Get the directory to save the file (external storage for Android, etc.)
    final directory = await getApplicationDocumentsDirectory();

    // Define the full path to the file
    final filePath = '${directory.path}/$filename';

    // Ensure the directory exists
    final directoryPath = Directory(directory.path);
    if (!(await directoryPath.exists())) {
      await directoryPath.create(
          recursive: true); // Create directory if it doesn't exist
    }

    // Perform the actual file download (using http or any package you use for downloading)
    final response =
        await http.get(Uri.parse(url)); // Assuming you use 'http' package

    // Write the response bytes to the file
    final file = File(filePath);
    return await file.writeAsBytes(response.bodyBytes);
  } catch (e) {
    print('Error downloading file: $e');
    throw Exception('Error downloading file: $e');
  }
}
