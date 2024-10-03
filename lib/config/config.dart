class Config {
   // sediakan variable penampung alamat url web services
  static String urlAPI = "http://192.168.1.3:8000/api";

  // sediakan variable penampung alamat url main websites (digunakan untuk ambil path file/gambar dr backend)
  static String urlMain = "http://192.168.1.3:8000/";

  // login,register, logiut
  String urlLogin = "$urlAPI/login";
  String urlLogout = "$urlAPI/logout";

  // buku service
  String urlBook = "$urlAPI/buku";
  String urlBookDownload = "$urlAPI/buku/{id}/downlaod";
}