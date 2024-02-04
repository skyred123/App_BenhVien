abstract class MapJson {
  static Map<String, dynamic> toMapDangNhap(String email, String password) {
    return <String, dynamic>{"identifier": email, "password": password};
  }
}
