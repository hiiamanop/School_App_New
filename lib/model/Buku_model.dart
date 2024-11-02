import 'package:school_super_app/config/config.dart';

class BukuModel {
  int id;
  int kategori_buku_id;
  String judul;
  String pdf_path;
  DateTime created_at;
  DateTime updated_at;

  BukuModel({
    required this.id,
    required this.kategori_buku_id,
    required this.judul,
    required this.pdf_path,
    required this.created_at,
    required this.updated_at
  });

  factory BukuModel.fromJson(Map<String, dynamic> json) => BukuModel(
    id: json["id"], 
    kategori_buku_id: json['kategori_buku_id'],
    judul: json["judul"], 
    pdf_path: Config.urlMain + 'storage/' + json['pdf_path'], 
    created_at: DateTime.parse(json["created_at"]),
    updated_at: DateTime.parse(json["updated_at"]),);
}