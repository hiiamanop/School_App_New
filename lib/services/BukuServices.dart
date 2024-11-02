import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:school_super_app/config/config.dart';
import 'package:school_super_app/model/Buku_model.dart';

class BookService {
  final baseUrl = Config().urlBook;

  Future<List<BukuModel>> fetchBooksByCategory(int kategoriBukuId) async {
    final response = await http.get(Uri.parse('$baseUrl?kategori_buku_id=$kategoriBukuId'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => BukuModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load books');
    }
  }
}
