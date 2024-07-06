import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

import 'dart:io';

class PDF {
  // load from network
  // static Future<File> loadNetwork(String path) async{
  //   final response = await http.get(url);
  //   final bytes = response.bodyBytes;

  //   return _storeFile(url,bytes);
  // }

  // store to app
  static Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();

    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }

  // pick file (pdf)
  // static Future<File> pickFile() async {
  //   final result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['pdf'],
  //   );

  //   if (result == null) return null;
  //   return File(result.paths.first);
  // }

  // load from asset
  static Future<File> loadAsset(String path) async {
    final data = await rootBundle.load(path);
    final bytes = data.buffer.asUint8List();

    return _storeFile(path, bytes);
  }
}
