class User {
  final int id;
  final String name;
  final String email;
  final String nomorInduk;
  final int roleId;
  final String tahunMasuk;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.nomorInduk,
    required this.roleId,
    required this.tahunMasuk,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      nomorInduk: json['nomor_induk'],
      roleId: json['role_id'],
      tahunMasuk: json['tahun_masuk'],
    );
  }
}
