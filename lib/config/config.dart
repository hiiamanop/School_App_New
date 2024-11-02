class Config {
  // sediakan variable penampung alamat url web services
  static String urlAPI = "http://192.168.1.3:8000/api";

  // sediakan variable penampung alamat url main websites (digunakan untuk ambil path file/gambar dr backend)
  static String urlMain = "http://192.168.1.3:8000/";

  String baseUrl = "http://192.168.1.3:8000";

  // login,register, logout
  String loginUrl = '$urlAPI/login';
  String profileUrl(String userId) =>
      '$urlAPI/profile/$userId'; // URL untuk profile dengan userId yang diikuti nanti

  // buku service
  String urlBook = "$urlAPI/buku";
  String urlBookDownload = "$urlAPI/buku/{id}/download";

  // Profile serviceau
  String urlUserProfile =
      "$urlAPI/user/profile"; // Tambahkan URL untuk profile user

  // URL for submitting an enrollment code
  String enrollUrl = "$urlAPI/enroll";
  String enrolledUrl = "$urlAPI/enrolled-classes";
}
