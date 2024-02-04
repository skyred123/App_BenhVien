import 'package:ui_appbenhvien/core/data/models/ct_lich_kham.dart';
import 'package:ui_appbenhvien/core/data/models/phieu_dang_ky.dart';
import 'package:ui_appbenhvien/core/data/models/tai_khoan.dart';

class ThongBao {
  int _id;
  String _tieude;

  String _noidung;

  String get noidung => _noidung;

  DateTime _thoigian;

  String _token;

  TaiKhoan? _taiKhoan;

  ThongBao({id, tieude, noidung, thoigian, token, taikhoan}): _id = id, _tieude=tieude,_noidung=noidung,_thoigian = thoigian, _token = token, _taiKhoan= taikhoan;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'data': {
        'tieude': _tieude,
        'noidung': _noidung,
        'thoigian': _thoigian.toString(),
        'token': _token,
        'taikhoan': taiKhoan?.id
      }
    };
  }

  factory ThongBao.fromMap(Map<String, dynamic> map) {
    final attributes = map['attributes'];

    var taikhoan = null;
    if (attributes['users_permissions_user'] != null &&
        attributes['users_permissions_user']['data'] != null) {
      taikhoan = TaiKhoan.fromMap(attributes['users_permissions_user']['data']);
    }
    return ThongBao(
        id: map['id'] as int,
        tieude: attributes['tieude'],
        noidung: attributes['noidung'],
        thoigian: DateTime.parse(attributes['thoigian']),
        token: attributes['token'],
        taikhoan: taikhoan,
        //ct_lich_kham: listct_lich_kham
        );
  }

  @override
  String toString() {
    return 'ThongBao{_id: $_id, _tieude: $_tieude, _noidung: $_noidung, _thoigian: $_thoigian, _token: $_token, taikhoan: ${taiKhoan.toString()}}';
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  TaiKhoan? get taiKhoan => _taiKhoan;

  set taiKhoan(TaiKhoan? value) {
    _taiKhoan = value;
  }

  set noidung(String value) {
    _noidung = value;
  }

  DateTime get thoigian => _thoigian;

  set thoigian(DateTime value) {
    _thoigian = value;
  }

  String get token => _token;

  set token(String value) {
    _token = value;
  }

  String get tieude => _tieude;

  set tieude(String value) {
    _tieude = value;
  }
}
