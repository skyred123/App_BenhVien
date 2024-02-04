// ignore_for_file: unnecessary_getters_setters, recursive_getters

import 'package:ui_appbenhvien/core/data/models/thong_bao.dart';
import 'package:ui_appbenhvien/core/data/repository/quyen_repository.dart';

class TaiKhoan {
  int _id;
  String _jwt;
  String _username;
  String _email;
  String _role;
  String _provider;
  bool _confirmed;
  bool _blocked;
  ThongBao? _thongBao;

  ThongBao? get thongBao => _thongBao;

  set thongBao(ThongBao? value) {
    _thongBao = value;
  }

  TaiKhoan(
      {required int id,
      required String jwt,
      required String username,
      required String email,
      required String role,
      required String provider,
      required bool confirmed,
      required bool blocked,
      thongBao})
      : _blocked = blocked,
        _confirmed = confirmed,
        _provider = provider,
        _email = email,
        _username = username,
        _role = role,
        _id = id,
        _jwt = jwt,
        _thongBao = thongBao;

  factory TaiKhoan.fromMap(Map<String, dynamic> map) {
    if (map['attributes'] != null) {
      final attributes = map['attributes'];
      return TaiKhoan(
          id: map['id'] as int,
          jwt: '',
          username: attributes["username"],
          email: attributes["email"],
          role: '',
          provider: attributes["provider"],
          confirmed: attributes["confirmed"],
          blocked: attributes["blocked"]);
    } else {
      final data = map['user'];
      return TaiKhoan(
          id: data["id"] as int,
          jwt: map['jwt'],
          username: data["username"],
          email: data["email"],
          role: '',
          provider: data["provider"],
          confirmed: data["confirmed"],
          blocked: data["blocked"]);
    }
  }

  Map<String, dynamic> toMapDangNhap(String email, String password) {
    return <String, dynamic>{"identifier": email, "password": password};
  }

  Map<String, dynamic> toMapDangKy(
      String username, String email, String password) {
    return <String, dynamic>{
      "username": username,
      "email": email,
      "password": password
    };
  }

  @override
  String toString() {
    return 'TaiKhoan{id: $id, jwt: $jwt, username: $username, email: $email, role: $role, provider: $provider, confirmed: $confirmed, blocked: $blocked}\n';
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get jwt => _jwt;

  set jwt(String value) {
    _jwt = value;
  }

  String get username => _username;

  set username(String value) {
    _username = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get role => _role;

  set role(String value) {
    _role = value;
  }

  String get provider => _provider;

  set provider(String value) {
    _provider = value;
  }

  bool get confirmed => _confirmed;

  set confirmed(bool value) {
    _confirmed = value;
  }

  bool get blocked => _blocked;
  set blocked(bool value) {
    _blocked = value;
  }
}
