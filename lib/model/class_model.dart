// lib/models/class_model.dart
class ClassModel {
  final int id;
  final String mataPelajaran;
  final String guru;
  final String kodeKelas;
  final int jumlahTugas;
  final TugasTerbaru? tugasTerbaru;

  ClassModel({
    required this.id,
    required this.mataPelajaran,
    required this.guru,
    required this.kodeKelas,
    required this.jumlahTugas,
    this.tugasTerbaru,
  });

  factory ClassModel.fromJson(Map<String, dynamic> json) {
    return ClassModel(
      id: json['id'],
      mataPelajaran: json['mata_pelajaran'],
      guru: json['guru'],
      kodeKelas: json['kode_kelas'],
      jumlahTugas: json['jumlah_tugas'] ?? 0,
      tugasTerbaru: json['tugas_terbaru'] != null
          ? TugasTerbaru.fromJson(json['tugas_terbaru'])
          : null,
    );
  }
}

class TugasTerbaru {
  final String judul;
  final String deadline;

  TugasTerbaru({
    required this.judul,
    required this.deadline,
  });

  factory TugasTerbaru.fromJson(Map<String, dynamic> json) {
    return TugasTerbaru(
      judul: json['judul'],
      deadline: json['deadline'],
    );
  }
}